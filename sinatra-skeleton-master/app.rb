class App < Sinatra::Base
  enable :sessions

  before do
    if session[:user_id]
      @user = RegularUser.get(session[:user_id])
    end
  end

  get '/' do
  	erb :login
  end

  post '/login' do
    "Du loggas in..."
    p params
    user = RegularUser.first(email: params["email"])
    p user
    if user && user.password == params["password"]
      session[:user_id] = user.id
      redirect '/user/issues'
    end

    redirect '/'
  end

  post '/logout' do
    session.destroy
    redirect '/'
  end

  get '/user/issues' do

    @issues = Issue.all
    erb :user_issues
  end

  get '/user/issue/:id' do |issue_id|
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => @issue.id)


        erb :user_show_issue
  end

  get '/user/issue/:id/update' do |issue_id|
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => @issue.id)

    erb :update_issue
  end

  post '/issue/:id/update' do |issue_id|
    Update.create(text:"#{params['update_text']}", issue_id: issue_id)
    redirect "/user/issue/#{issue_id}"
  end

  get '/user/knowledgebase' do
    @articles = Article.all

    erb :user_knowledgebase
  end

  get '/user/knowledgebase/article/:id' do |article_id|
    @article = Article.first(:id => article_id)

    erb :knowledgebase_article
  end

  get '/issue/create' do
    @categories = Category.all

    erb :create_issue
  end

  post '/issue/create' do
    p params
    if params['notification'] == "set"
      notification = true
    else
      notification = false
    end

    created_issue = Issue.create(title:"#{params['title']}", email:"#{@user.email}", notification:notification, category_id:"#{params['category']}", regular_user_id:"#{@user.id}")
    created_update = Update.create(text:"#{params['issue_text']}", issue_id:created_issue.id)


    files = params[:attachments]
    files.each do |file|
      p file
      original_name = file[:filename]
      tmpfile = file[:tempfile]

      filetype = file[:type].split('/')[1] #file[:type] always looks like image/*type*

      new_name = (0...30).map { ('a'..'z').to_a[rand(26)] }.join #Creates a random string with 30 letters

      File.open("public/uploads/#{new_name}.#{filetype}", "w") do |f|
        f.write(tmpfile.read)
      end

      CaseAttachment.create(path:"/uploads/#{new_name}.#{filetype}", name:original_name, update_id:created_update.id, article_id:1)
    end

    redirect '/user/issues'
  end
end





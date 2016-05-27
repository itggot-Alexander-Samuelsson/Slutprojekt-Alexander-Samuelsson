require 'rack-flash'

class App < Sinatra::Base
  enable :sessions
  use Rack::Flash
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
    # if user == nil
    #   user = AdminUser.first(email: params["email"])
    # end
    p user
    if user && user.password == params["password"]
      session[:user_id] = user.id
      redirect '/user/issues'
    end
    flash[:no_login] = ""
    redirect '/'
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

  get '/user/issues' do
    if @user
    @issues = Issue.all(regular_user_id: @user.id)
    p @issues
    erb :user_issues
    else
      flash[:not_logged_in] = ""
      redirect '/'
    end
  end

  get '/user/issue/:id' do |issue_id|
    if @user
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => @issue.id)

    erb :user_show_issue
    else
      flash[:not_logged_in] = ""
      redirect '/'
    end

  end

  get '/user/issue/:id/update' do |issue_id|
    if @user
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => @issue.id)

    erb :update_issue
    else
      flash[:not_logged_in] = ""
      redirect '/'
    end

  end

  post '/issue/:id/update' do |issue_id|
    created_update = Update.create(text:"#{params['update_text']}", issue_id: issue_id)
    flash[:issue_created] = ""
    if params[:attachments] != nil
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
    end

    redirect "/user/issue/#{issue_id}"
  end

  post '/user/issue/:id/remove' do |issue_id|
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => issue_id)
    @updates.each do |update|
      @files = CaseAttachment.all(:update_id => update.id)
      @files.each {|file| file.destroy}
      update.destroy
    end

    @issue.destroy

    flash[:issue_removed] = ""
    redirect '/user/issues'
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
    if @user
    @categories = Category.all

    erb :create_issue
    else
      flash[:not_logged_in] = ""
      redirect '/'
    end

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
    flash[:issue_created] = ""

    if params[:attachments] != nil
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
    end


    redirect '/user/issues'
  end

  #ADMIN STUFF STARTS HERE

  get '/admin/issues' do
  @issues = Issue.all
  erb :admin_issues
  end

  get '/admin/issue/:id' do |issue_id|
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => @issue.id)


    erb :admin_show_issue

  end

  get '/admin/users' do
    erb :admin_users
  end

  get '/admin/knowledgebase' do
    erb :admin_knowledgebase
  end

end





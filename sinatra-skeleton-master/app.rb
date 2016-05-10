class App < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user_id]
      redirect '/user/issues'
    end
  	erb :login
  end

  post '/login' do
    "Du loggas in..."
    p params
    user = RegularUser.first(email: params["email"])
    if user && user.password == params["password"]
      session[:user_id] = user.id
    end


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



end
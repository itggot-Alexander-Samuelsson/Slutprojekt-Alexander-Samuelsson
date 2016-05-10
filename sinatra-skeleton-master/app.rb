class App < Sinatra::Base
  enable :sessions

  get '/' do

  	erb :login
  end

  post '/login' do
    "Du loggas in..."
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

  get '/user/knowledgebase' do
    @articles = Article.all

    erb :user_knowledgebase
  end

  get '/user/knowledgebase/article/:id' do |article_id|
    @article = Article.first(:id => article_id)

    erb :knowledgebase_article
  end

  get '/issue/create' do


    erb :create_issue
  end


end
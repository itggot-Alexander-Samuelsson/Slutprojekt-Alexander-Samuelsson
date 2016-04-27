class App < Sinatra::Base
  enable :sessions

  get '/' do

  	erb :login
  end

  post 'login' do
#GÖR ÄRENDEN OCH ANNAT FÖRE LOGIN
  end

  get '/user/issues' do
    @issues = Issue.all
    erb :user_issues
    #FRÅGA DANIEL: ERB I MAPPAR
  end

  get '/user/issue/:id' do |issue_id|
    @issue = Issue.first(:id => issue_id)
    @updates = Update.all(:issue_id => @issue.id)

    erb :user_show_issue
  end



end
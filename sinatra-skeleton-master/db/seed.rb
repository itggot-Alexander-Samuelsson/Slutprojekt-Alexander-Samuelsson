class Seeder

  def self.seed!
    category
    issue
    update
    user
    article
    file
  end

  def self.category
    Category.create(name:'Dator')
    Category.create(name:'Användarnamn')
    Category.create(name:'Epost')
    Category.create(name:'Inloggning')
    Category.create(name:'Övrigt')
  end
  def self.issue
    Issue.create(title:'Blåskärm', email:'hej@gmail.com', category_id:1 )
    Issue.create(title:'Kan inte logga in', email:'hopp@gmail.com', category_id:2)
  end
  def self.update
    Update.create(text:'Bla bla bla jag har blåskärm', issue_id:1)
    Update.create(text:'Bla bla bla jag kan inte logga in', issue_id:2)
  end
  def self.user
    User.create(fname:'Boyert', lname:'Boyertsson', email:'boyert123@gmail.com', password:'boyert1337')
  end
  def self.article
    article = Article.create(title:'Kan inte ansluta till nätverk', text:'Såhär gör du bla bla bla bla')
    article.categories << Category.get(1)
    article.save
  end
  def self.file
    ArticleAttachment.create(path: './public/img/smile.png', name:'smile', article_id:1)
    CaseAttachment.create(path: './public/img/smile.png', name:'smile again', update_id:1)
  end


end
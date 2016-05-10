class Seeder

  def self.seed!
    file
    category
    issue
    user
    update
    article

  end

  def self.category
    Category.create(name:'Dator')
    Category.create(name:'Användarnamn')
    Category.create(name:'Epost')
    Category.create(name:'Inloggning')
    Category.create(name:'Övrigt')
  end
  def self.issue
    Issue.create(title:'Blåskärm', email:'hej@gmail.com', category_id:1, regular_user_id:1)
    Issue.create(title:'Kan inte logga in', email:'hopp@gmail.com', category_id:2, regular_user_id:1)
  end
  def self.update
    Update.create(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas.', issue_id:1)
    Update.create(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas.', issue_id:1)
    Update.create(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas.', issue_id:1)
    Update.create(text:'Bla bla bla jag kan inte logga in', issue_id:2)
    Update.create(text:'Bla bla bla jag kan inte logga in', issue_id:2)

  end
  def self.user
    RegularUser.create(fname:'Boyert', lname:'Boyertsson', email:'boyert@m.m', password:'boyert1337')
  end
  def self.article
    article = Article.create(title:'Kan inte ansluta till nätverk', text:'Såhär gör du bla bla bla bla')
    article.categories << Category.get(1)
    article.save
    article2 = Article.create(title:'Hittade en banan i datorn', text:'Såhär gör du bla bla bla bla')
    article2.categories << Category.get(1)
    article2.save
  end
  def self.file
    ArticleAttachment.create(path: '/img/smile.png', name:'smile', article_id:1, update_id:1)
    CaseAttachment.create(path: '/img/smile.png', name:'smile again', update_id:1, article_id:1)
    CaseAttachment.create(path: '/img/smile.png', name:'smile again', update_id:1, article_id:1)
    CaseAttachment.create(path: '/img/smile.png', name:'smile again', update_id:1, article_id:1)

  end


end
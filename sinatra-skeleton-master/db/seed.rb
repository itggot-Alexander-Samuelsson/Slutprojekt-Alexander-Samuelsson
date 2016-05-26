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
    # Issue.create(title:'Blåskärm', email:'hej@gmail.com', category_id:1, regular_user_id:1)
    # Issue.create(title:'Kan inte logga in', email:'hopp@gmail.com', category_id:2, regular_user_id:1)
  end
  def self.update
    # Update.create(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas.', issue_id:1)
    # Update.create(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas.', issue_id:1)
    # Update.create(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad asperiores aut dolor dolorem dolores ducimus eum explicabo fugit harum ipsum iste modi mollitia porro praesentium rem saepe temporibus, voluptas.', issue_id:1)
    # Update.create(text:'Bla bla bla jag kan inte logga in', issue_id:2)
    # Update.create(text:'Bla bla bla jag kan inte logga in', issue_id:2)

  end
  def self.user
    RegularUser.create(fname:'Boyert', lname:'Boyertsson', email:'boyert@m.m', password:'boyert1337')
    AdminUser.create(fname:'Admin', lname:'Adminsson', admin:true, email:'admin@a.a', password:'admin')
  end
  def self.article
    article = Article.create(title:'Kan inte ansluta till nätverk ', text:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra sem eget nibh semper, eu faucibus tortor malesuada. Donec fermentum nec ex id finibus. Quisque gravida urna massa, id tristique libero lacinia sit amet. Pellentesque at urna suscipit, scelerisque leo nec, suscipit magna. Cras ut urna ac arcu dignissim porta. Vestibulum ac diam porttitor, sodales ipsum in, imperdiet lorem. Sed sed ipsum convallis, euismod quam vel, ultrices dui. Sed ullamcorper nisi sit amet dui dapibus, sed porttitor odio blandit. Cras blandit suscipit sapien. Nulla vestibulum, libero eget ultrices fringilla, mi est viverra sapien, a commodo nunc mi eget est. Donec fermentum ante vitae augue accumsan ultricies.

Vestibulum iaculis orci elit, quis vestibulum dui vehicula eu. Etiam sapien metus, congue eget erat sit amet, fringilla hendrerit metus. Phasellus imperdiet justo sed imperdiet dapibus. Morbi egestas nec mauris sed consectetur. Ut dui justo, hendrerit non posuere pellentesque, accumsan quis neque. Morbi gravida ipsum ante. Duis commodo odio nisl, et finibus justo aliquet nec. Sed rhoncus nibh et accumsan ullamcorper.

Ut eget nibh vel ligula iaculis posuere vel id nisi. Nulla feugiat tortor urna. In ligula sem, sagittis eu nunc in, blandit condimentum ipsum. Proin varius sapien quam, sit amet dapibus orci lacinia in. Morbi interdum est quis risus posuere iaculis. Suspendisse at enim quis erat molestie rutrum eu id nulla. Proin mattis a tellus id tempor. Morbi molestie ultrices tempus. Aliquam rutrum faucibus leo non venenatis. Integer sit amet tortor et eros rutrum luctus quis in augue. Nulla at turpis et est aliquam tincidunt. Etiam consectetur purus vel est bibendum, id venenatis purus posuere.

Duis molestie nec tortor vel pellentesque. Phasellus imperdiet iaculis sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut aliquam a tellus et semper. Suspendisse semper, libero sit amet accumsan mattis, nisl ipsum fringilla ante, non molestie orci metus a lectus. Praesent interdum ultricies dui, ut tristique lorem molestie quis. Curabitur elementum sed arcu vitae hendrerit. Duis vel accumsan felis. Nullam euismod pretium ipsum, quis porta lorem efficitur eget. Nam lobortis, libero at ullamcorper aliquet, dui diam finibus elit, et pretium turpis tellus at felis. Nulla ut consectetur eros.

Aliquam vel diam id urna sollicitudin finibus. Nullam elementum tincidunt velit et ultricies. Quisque id lorem efficitur, euismod eros at, placerat turpis. Phasellus tincidunt eleifend arcu vitae tempus. Aliquam pharetra nibh ex, sed dignissim elit faucibus eu. Duis fringilla tellus et facilisis vestibulum. Aliquam rhoncus non enim in pretium. Aliquam tincidunt vulputate sagittis. Maecenas massa elit, interdum nec massa vitae, pretium efficitur sapien. Nullam justo purus, vulputate sit amet pellentesque ut, sagittis eget justo. Aenean aliquam dictum nisi eu pretium.')
    article.categories << Category.get(1)
    article.save
    article2 = Article.create(title:'Hittade en banan i datorn', text:'Såhär gör du bla bla bla bla')
    article2.categories << Category.get(2)
    article2.save
  end
  def self.file
     ArticleAttachment.create(path: '/img/smile.png', name:'smile', article_id:1, update_id:1)
     ArticleAttachment.create(path: '/img/broken-computer.jpg', name:'smile', article_id:1, update_id:1)
     ArticleAttachment.create(path: '/img/smile.png', name:'smile', article_id:2, update_id:1)

    # CaseAttachment.create(path: '/img/smile.png', name:'smile again', update_id:1, article_id:1)
    # CaseAttachment.create(path: '/img/smile.png', name:'smile again', update_id:1, article_id:1)
    # CaseAttachment.create(path: '/img/smile.png', name:'smile again', update_id:1, article_id:1)

  end


end
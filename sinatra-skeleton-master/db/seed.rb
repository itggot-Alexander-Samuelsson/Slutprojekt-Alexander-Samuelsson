class Seeder

  def self.seed!
    category
    issue
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
  end
  def self.update
    Update.create(text:'Bla bla bla jag har blåskärm hahaha', issue_id:1)
  end


end
require 'dm-timestamps'

class User

  include DataMapper::Resource

  property :id,       Serial
  property :fname,    String
  property :lname,    String
  property :admin,    Boolean, :default => false
  property :email,    String, :required => true
  property :password, BCrypt, :required => true

  #skapa relationer för ärenden och artiklar senare

end
require 'dm-timestamps'
require 'bcrypt'
class User

  include DataMapper::Resource

  property :id,       Serial
  property :fname,    String
  property :lname,    String
  property :admin,    Boolean, :default => false
  property :email,    String, :required => true
  property :password, BCryptHash, :required => true
  property :type, Discriminator
end

  class AdminUser < User
    has n, :issue
  end

  class RegularUser < User
    has n, :issue
  end
require 'dm-timestamps'

class Issue

  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :title,      String, :required => true
  property :email,      String
  property :status,     Enum[ :Otilldelad, :Aktiv, :Stängd], :default => :Otilldelad
  property :notification, Boolean

  has n, :updates
  belongs_to :category
  belongs_to :regular_user
  belongs_to :admin_user, required: false

end
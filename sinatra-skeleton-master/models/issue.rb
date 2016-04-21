require 'dm-timestamps'

class Issue

  include DataMapper::Resource

  property :id,         Serial
  property :created_at, DateTime
  property :title,      String, :required => true
  property :email,      String
  property :status,     Enum[ :unassigned, :assigned, :closed], :default => :unassigned

  has n, :updates
  belongs_to :category
end
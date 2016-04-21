class Update

  include DataMapper::Resource

  property :id,   Serial
  property :text, Text

  belongs_to :issue
  has n, :files

end
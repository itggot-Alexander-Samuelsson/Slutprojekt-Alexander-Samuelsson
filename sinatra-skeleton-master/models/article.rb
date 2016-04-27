class Article

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :text,   Text

  has n, :attachments
  has n, :categories, :through => Resource
end
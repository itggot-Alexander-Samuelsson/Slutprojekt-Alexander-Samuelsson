class File
  include DataMapper::Resource

  property :id,     Serial
  property :source, String
  property :type,   Discriminator

end

class ArticleFile < File

  belongs_to :article

end

class CaseFile < File

  belongs_to :update
end
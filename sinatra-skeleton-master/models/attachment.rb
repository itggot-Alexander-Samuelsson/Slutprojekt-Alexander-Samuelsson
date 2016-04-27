class Attachment
  include DataMapper::Resource
  property :id,     Serial
  property :path,   FilePath
  property :name,   String
  property :type,   Discriminator

end

class ArticleAttachment < Attachment
  belongs_to :article
end

class CaseAttachment < Attachment
  belongs_to :update
end
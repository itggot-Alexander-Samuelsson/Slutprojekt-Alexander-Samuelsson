class Attachment
  include DataMapper::Resource
  property :id,     Serial
  property :path,   FilePath
  property :name,   String
  property :type,   Discriminator

end

class ArticleAttachment < Attachment
  belongs_to :article, required: false
end

class CaseAttachment < Attachment
  belongs_to :update, required: false
end
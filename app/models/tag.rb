class Tag
  include DataMapper::Resource
  storage_names[:default] = "Tag"
  
  property :id,   Serial
  property :name, String,        :required => true, :length => 500
  timestamps :at 

  has n, :taggings
  has n, :tasks, :through => :taggings
end

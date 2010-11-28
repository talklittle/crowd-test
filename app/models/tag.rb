class Tag
  include DataMapper::Resource
  storage_names[:default] = "Tag"
  
  property :id,   Serial
  property :name, String,        :required => true,  :length => 500
  property :type, String,        :required => false, :length => 500
  timestamps :at 

  has n, :tag_tasks
  has n, :tasks, :through => :tag_tasks
end

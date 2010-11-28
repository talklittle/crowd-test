class Tag
  include DataMapper::Resource
  storage_names[:default] = "Tag"
  
  property :id,   Serial
  property :name, String,        :required => true,  :length => 500
  property :type, String,        :required => false, :length => 500
  timestamps :at 

  def tasks
    Task.all(:tag_ids => id)
  end
end

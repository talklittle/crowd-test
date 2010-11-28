class TagTask
  include DataMapper::Resource
  storage_names[:default] = "TagTask"
  
  timestamps :at 

  belongs_to :tag,  :key => true
  belongs_to :task, :key => true
end

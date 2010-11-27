class Tagging
  include DataMapper::Resource
  storage_names[:default] = "Tagging"
  
  property :id, Serial
  timestamps :at 

  belongs_to :tag,  :key => true
  belongs_to :task, :key => true
end

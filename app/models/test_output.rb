class TestOutput
  include DataMapper::Resource
  storage_names[:default] = "TestOutput"
  
  property :id,         Serial
  property :data,       Blob,          :required => true
  property :size_bytes, Integer,       :required => true
  timestamps :at 

  belongs_to :user
  belongs_to :task

end

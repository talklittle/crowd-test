class Script
  include DataMapper::Resource
  storage_names[:default] = "Script"
  
  property :id,         Serial
  property :language,   String,        :required => true, :length => 500
  property :size_bytes, Integer,       :required => true
  property :code,       Blob,          :required => true
  timestamps :at 

  belongs_to :user
  belongs_to :task

end

class OS
  include DataMapper::Resource
  storage_names[:default] = "OS"
  
  property :id,      Serial
  property :name,    String,        :required => true, :length => 500
  property :version, String,        :required => true, :length => 500
  timestamps :at 
end

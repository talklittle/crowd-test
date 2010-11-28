class Language
  include DataMapper::Resource
  storage_names[:default] = "Language"
  
  property :id,      Serial
  property :name,    String,        :required => true,  :length => 500
  property :version, String,        :required => false, :length => 500
  timestamps :at 

  belongs_to :script

end

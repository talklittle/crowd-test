class User
  include DataMapper::Resource
  storage_names[:default] = "User"
  
  property :id,             Serial
  property :username,       String,        :required => true, :length => 500
  property :password,       String,        :required => true, :length => 500
  property :testerscore,    Integer,       :required => true
  property :evaluatorscore, Integer,       :required => true
  property :requestorscore, Integer,       :required => true
  timestamps :at 
end

class User
  include DataMapper::Resource
  storage_names[:default] = "User"
  
  property :id,              Serial
  property :username,        String,        :required => true, :length => 500
  property :password,        String,        :required => true, :length => 500
  property :tester_score,    Integer,       :required => true
  property :evaluator_score, Integer,       :required => true
  property :requester_score, Integer,       :required => true
  timestamps :at 
end

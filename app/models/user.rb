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

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
end

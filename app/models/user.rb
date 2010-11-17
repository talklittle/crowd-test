class User
  include DataMapper::Resource
  storage_names[:default] = "User"

  before_save :encrypt_password
  
  property :id,                  Serial
  property :username,            String,        :required => true, :length => 500
  property :encrypted_password,  String,        :required => true, :length => 500
  property :salt,                String,        :required => true, :length => 500
  property :remember_token,      String,        :required => true, :length => 500
  property :tester_score,        Integer,       :required => true
  property :evaluator_score,     Integer,       :required => true
  property :requester_score,     Integer,       :required => true
  timestamps :at 


  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}")
    save_without_validation
  end
  

  private

    def encrypt_password
      unless password.nil?
        self.salt = make_salt
        self.encrypted_password = encrypt(password)
      end
    end

end

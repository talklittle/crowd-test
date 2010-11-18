class User
  include DataMapper::Resource
  storage_names[:default] = "User"

  before :save, :encrypt_password

  #attr_accessible :name, :email, :password, :password_confirmation
  
  property :id,                  Serial
  property :email,               String,        :required => true,  :length => 500
  property :encrypted_password,  String,        :required => false, :length => 500
  property :salt,                String,        :required => false, :length => 500
  property :remember_token,      String,        :required => false, :length => 500
  property :tester_score,        Integer,       :required => true
  property :evaluator_score,     Integer,       :required => true
  property :requester_score,     Integer,       :required => true
  timestamps :at 

  def password=(password)
    @password = password
  end

  def password
    @password
  end

  def password_confirmation(password)
    @password_confirmation = password
  end

  def password_confirmation
    @password_confirmation
  end

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
    save
  end
  

  private

    def encrypt_password
      unless password.nil?
        self.salt = make_salt
        self.encrypted_password = encrypt(password)
      end
    end

    def encrypt(string)
      secure_hash("#{salt}#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    

end

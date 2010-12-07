class Script
  include DataMapper::Resource
  storage_names[:default] = "Script"

  before :save, :calculate_size
  
  property :id,         Serial
  property :size_bytes, Integer,       :required => false
  property :code,       Blob,          :required => true
  property :upvote_user_ids, List
  timestamps :at 

  belongs_to :user
  belongs_to :task
  has 1, :language


  def num_upvotes
    self.upvote_user_ids.nil? ? 0 : self.upvote_user_ids.size
  end

  def upvoted?(user)
    !user.nil? and !self.upvote_user_ids.nil? and self.upvote_user_ids.include?(user.id)
  end

  def upvote(user)
    if user.nil?
      return
    end
    if self.upvote_user_ids.nil?
      self.upvote_user_ids = []
    end
    return if self.upvote_user_ids.include?(user.id)

    self.upvote_user_ids << user.id
    save
  end


  private

  def calculate_size
    if self.code.nil?
      self.size_bytes = 0
    else
      self.size_bytes = self.code.length
    end
  end


end

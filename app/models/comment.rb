class Comment
  include DataMapper::Resource
  storage_names[:default] = "Comment"
  
  property :id,   Serial
  property :body, String,        :required => true, :length => 500
  property :upvote_user_ids, List
  timestamps :at 

  belongs_to :user
  belongs_to :task

  def num_upvotes
    self.upvote_user_ids.nil? ? 0 : self.upvote_user_ids.size
  end

  def upvoted?(user)
    !user.nil? and !self.upvote_user_ids.nil? and self.upvote_user_ids.includes?(user)
  end

  def upvote(user)
    if user.nil?
      return
    end
    if self.upvote_user_ids.include?(user.id)
      return
    end

    if self.upvote_user_ids.nil?
      self.upvote_user_ids = []
    end
    self.upvote_user_ids << user.id
    save
  end


end

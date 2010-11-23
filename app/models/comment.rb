class Comment
  include DataMapper::Resource
  storage_names[:default] = "Comment"
  
  property :id,   Serial
  property :body, String,        :required => true, :length => 500
  timestamps :at 

  belongs_to :user
  belongs_to :task

end

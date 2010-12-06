class CommentVote
  include DataMapper::Resource
  storage_names[:default] = "CommentVote"
  
  property :id, Serial
  timestamps :at 
end

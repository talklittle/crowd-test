class ScriptVote
  include DataMapper::Resource
  storage_names[:default] = "ScriptVote"
  
  property :id, Serial
  timestamps :at 
end

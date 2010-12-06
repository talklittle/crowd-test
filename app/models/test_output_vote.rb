class TestOutputVote
  include DataMapper::Resource
  storage_names[:default] = "TestOutputVote"
  
  property :id, Serial
  timestamps :at 
end

class Task
  include DataMapper::Resource
  storage_names[:default] = "Task"
  
  property :id,               Serial
  property :tested,           Boolean,       :required => true
  property :expire_date,      Date,          :required => true
  property :description,      String,        :required => true, :length => 500
  property :duration_minutes, Integer,       :required => true
  timestamps :at 

  belongs_to :user
  has n, :scripts

  acts_as_taggable
  acts_as_taggable_on :os


end

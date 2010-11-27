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
  has n, :taggings
  has n, :tags, :through => :taggings

  def self.search(search_term)
    search_condition = "%" + search_term + "%"
    find(:all, :conditions => ['description LIKE ?', search_condition])
    # TODO also search scripts?
  end

end

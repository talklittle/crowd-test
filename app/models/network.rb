class Network
  include DataMapper::Resource
  storage_names[:default] = "Network"
  
  property :id,         Serial
  property :speed_mbps, Integer,       :required => true
  property :type,       String,        :required => true, :length => 500
  timestamps :at 

  belongs_to :user

end

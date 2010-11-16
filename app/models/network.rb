class Network
  include DataMapper::Resource
  storage_names[:default] = "Network"
  
  property :id,         Serial
  property :owner_id,   Integer,       :required => true
  property :speed_mbps, Integer,       :required => true
  property :type,       String,        :required => true, :length => 500
  timestamps :at 
end

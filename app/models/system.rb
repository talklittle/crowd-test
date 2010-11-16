class System
  include DataMapper::Resource
  storage_names[:default] = "System"
  
  property :id,         Serial
  property :owner_id,   Integer,       :required => true
  property :cpu_mhz,    Integer,       :required => true
  property :ram_mbytes, Integer,       :required => true
  property :os,         String,        :required => true, :length => 500
  timestamps :at 
end

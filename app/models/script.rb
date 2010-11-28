class Script
  include DataMapper::Resource
  storage_names[:default] = "Script"

  before :save, :calculate_size
  
  property :id,         Serial
  property :size_bytes, Integer,       :required => false
  property :code,       Blob,          :required => true
  timestamps :at 

  belongs_to :user
  belongs_to :task
  has 1, :language

  has_tags_on :tags, :operating_systems


  private

  def calculate_size
    if self.code.nil?
      self.size_bytes = 0
    else
      self.size_bytes = self.code.length
    end
  end

end

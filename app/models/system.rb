class System
  include DataMapper::Resource
  storage_names[:default] = "System"
  
  property :id,         Serial
  property :cpu_mhz,    Integer,       :required => true
  property :ram_mbytes, Integer,       :required => true
  property :os,         String,        :required => true, :length => 500
  property :tag_ids,    List
  timestamps :at 

  belongs_to :user

  def tags
    tagstr = ""
    Tag.all(:id => tag_ids).each do |tt|
      if tagstr == ""
        tagstr = tt.name
      else
        tagstr += ", #{tt.name}"
      end
    end
    tagstr
  end

  def tags=(newtags)
    taglist = []
    # associate new tags
    ts = newtags.split(/,/)
    ts.each do |t|
      t.strip!
      t.downcase!
      tag = Tag.first({:name => t})
      if tag.nil?
        tag = Tag.create({:name => t})
      end
      taglist << tag.id
    end
    self.tag_ids = taglist
  end

end

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

  has n, :tag_tasks
  has n, :tags, :through => :tag_tasks

  def taghelp
    tagstr = ""
    self.tags.each do |tt|
      if tagstr == ""
        tagstr = tt.name
      else
        tagstr += ", #{tt.name}"
      end
    end
    tagstr
  end

  def taghelp=(newtags)
    # destroy old tags first
    self.tags.each do |tag|
      self.tag_tasks.first(:tag => tag).destroy
    end
    # associate new tags
    ts = newtags.split(/,/)
    ts.each do |t|
      t.strip!
      tag = Tag.find({:name.like => t})
      if tag.nil?
        tag = Tag.create({:name => t})
      end
      TagTask.create(:tag => tag, :task => self)
    end
  end

end

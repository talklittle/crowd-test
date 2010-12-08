class Task
  include DataMapper::Resource
  storage_names[:default] = "Task"
  
  property :id,               Serial
  property :tested,           Boolean,       :required => false, :default => false
  property :expire_date,      Date,          :required => true
  property :description,      String,        :required => true, :length => 500
  property :duration_minutes, Integer,       :required => true

  property :tag_ids,          List
  timestamps :at 

  belongs_to :user
  has n, :scripts

  # Get the relevance scores [num_matching_types, num_matching]
  def relevance(user_id)
    user = User.get(user_id)
    return [] if user.nil?
    matching_types = []
    num_matching = 0
    self.tag_ids.each do |tag_id|
      tag = Tag.get(tag_id)
      has_match = false
      for user.systems.each do |sys|
        if tag.systems.include?(sys)
          has_match = true
          if not matching_types.include?(tag.type)
            matching_types << tag.type
            break
          end
        end
      end
      if has_match
        num_matching += 1
      end
    end
    return [matching_types.size, num_matching]
  end

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

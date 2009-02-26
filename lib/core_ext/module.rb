class Module
  def tl_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
        Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"]
      end

      define_method("#{name}=".to_sym) do |new_value|
        Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"] = new_value
      end
    end
  end
  
  def tl_attr_reader(*names)
    names.each do |name|
      define_method(name) do
        Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"]
      end
    end
  end

  def tl_attr_writer(*names)
    names.each do |name|
      define_method("#{name}=".to_sym) do |new_value|
        Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"] = new_value
      end
    end
  end
end
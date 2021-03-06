class Module
  def tl_attr_accessor(*names)
    tl_attr_reader(*names)
    tl_attr_writer(*names)
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
  
  def tl_attr(name, writable = false)
    tl_attr_reader(name)
    
    tl_attr_writer(name) if writable
  end
end
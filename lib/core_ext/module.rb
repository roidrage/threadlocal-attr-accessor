class Module
  def ts_attr_accessor(name)
    define_method(name) do
      Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"]
    end

    define_method("#{name}=".to_sym) do |new_value|
      Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"] = new_value
    end
  end
  
  def ts_attr_reader(name)
    define_method(name) do
      Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"]
    end
  end

  def ts_attr_writer(name)
    define_method("#{name}=".to_sym) do |new_value|
      Thread.current["#{self.class.name.downcase}_#{object_id}_#{name.to_s}"] = new_value
    end
  end
end
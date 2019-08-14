module InstanceCounter 
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
    #Другие способы подмешать инстанс переменную класс-уровня не сработали
    base.instance_variable_set(:@instances_count, 0)
  end

  module InstanceMethods
    protected

  end


  module ClassMethods
    def instances
      return @instances_count
    end

    def register_instance
      self.instances_count = instances + 1 
    end

    protected
    
    #как это инкапсулировать? 
    attr_writer :instances_count

    private 
    
    #Необходимо для наследования переменной дочерними классами содержащими эту примесь 
    def inherited(subclass)
      subclass.instance_variable_set(:@instances_count, 0)
    end
  end
end

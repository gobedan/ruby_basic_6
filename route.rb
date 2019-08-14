require_relative './instance_counter.rb'

class Route 
  include InstanceCounter

  attr_reader :route_list

  def initialize(first, last)
    @route_list = [first, last]
    raise "Invalid station in route!" unless valid? 
    self.class.register_instance
  end

  def valid? 
    route_list[0] && route_list[1]
  end 

  def add_station(station)
    route_list.push(station)
  end

  def remove_station(station)
    route_list.delete(station) if route_list.size > 2 
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require 'pry'

class HouseTest < MiniTest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_can_return_price
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.price
  end
  def test_it_can_return_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal "123 sugar lane", house.address
  end

  def test_it_will_return_a_empty_array
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
  end

  def test_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    house.add_room(room_1)
    house.add_room(room_2)
    assert_instance_of Room, house.rooms[0]
    assert_instance_of Room, house.rooms[1]
  end
end

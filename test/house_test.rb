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

  def test_can_group_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal :bedroom, house.rooms_from_category(:bedroom)[0].category
    assert_equal :bedroom, house.rooms_from_category(:bedroom)[1].category
    assert_equal :basement, house.rooms_from_category(:basement)[0].category
  end

  def test_area_works_with_multiple_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal 1900, house.area
  end

  def test_will_return_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal 210.53, house.price_per_square_foot
  end

  def test_can_sort_rooms_by_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_3)
    house.add_room(room_4)
    house.add_room(room_2)
    house.add_room(room_1)
    area_sorted_rooms = house.rooms_sorted_by_area
    assert_equal 130, area_sorted_rooms[0].area
    assert_equal 165, area_sorted_rooms[1].area
    assert_equal 375, area_sorted_rooms[2].area
    assert_equal 1230, area_sorted_rooms[3].area
  end

  def test_can_sort_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    category_sorted_rooms = house.rooms_by_category
    assert_equal :basement, category_sorted_rooms[0].category
    assert_equal :bedroom, category_sorted_rooms[1].category
    assert_equal :bedroom, category_sorted_rooms[2].category
    assert_equal :living_room, category_sorted_rooms[3].category

  end
end

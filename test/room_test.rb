require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require 'pry'

class RoomTest < MiniTest::Test
  def test_it_exists
    room = Room.new(:bedroom, 10, 13)
    assert_instance_of Room, room
  end

  def test_can_return_category
    room = Room.new(:bedroom, 10, 13)
    assert_equal :bedroom, room.category
  end
  def test_it_can_return_area
    room = Room.new(:bedroom, 10, 13)
    assert_equal 130, room.area
  end
end

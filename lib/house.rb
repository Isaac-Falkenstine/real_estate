require './lib/room'

class House
  attr_reader :address

  def initialize(price, address)
    @price = price
    @address = address
    @house_rooms = []
  end

  def price
    @price[0] = ""
    @price.to_i
  end

  def rooms
    @house_rooms
  end

  def add_room(room)
    @house_rooms << room
  end
end

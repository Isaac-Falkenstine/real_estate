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

  def rooms_from_category(category)
    category_array = @house_rooms.map do |room|
      if room.category == category
        room
      end
    end
    category_array.compact
  end

  def area
    area_total = 0
    @house_rooms.each do |room|
      room_area = room.height * room.base
      area_total += room_area
    end
    area_total
  end

  def price_per_square_foot
    price_per_sqr_ft = self.price.to_f / self.area
    price_per_sqr_ft.round(2)
  end

  def rooms_sorted_by_area
    sorted_rooms_by_area = @house_rooms.sort_by do |room|
      room.area
    end
  end

  def rooms_by_category
    sorted_rooms_by_category = @house_rooms.sort_by do |room|
      room.category
    end
  end
end

class Room
  attr_reader :category,
              :height,
              :base

  def initialize(category, height, base)
    @category = category
    @height = height
    @base = base
  end

  def area
    area = @height * @base
  end
end

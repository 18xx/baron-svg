class Tile
  SIDE_LENGTH = 88
  WIDTH = 2 * SIDE_LENGTH
  HEIGHT = (SIDE_LENGTH * Math.sqrt(3)).round
  OFFSET = SIDE_LENGTH / 72
  CENTER = Point.new(WIDTH / 2, HEIGHT / 2)

  attr_reader :tile_elements

  def initialize(color)
    @tile_elements = []
    @color = color.to_s
  end

  def add(element)
    @tile_elements << element
  end

  def hex_points
    [
      Point.new(SIDE_LENGTH / 2, 0),
      Point.new(SIDE_LENGTH * 3 / 2, 0),
      Point.new(WIDTH,  HEIGHT / 2),
      Point.new(SIDE_LENGTH * 3 / 2, HEIGHT),
      Point.new(SIDE_LENGTH / 2, HEIGHT),
      Point.new(0, HEIGHT / 2)
    ]
  end

  def to_s
    %{
      <svg
        xmlns="http://www.w3.org/2000/svg"
        height="#{HEIGHT}"
        width="#{WIDTH}">

        <polygon points="#{hex_points.map(&:to_s).join ' '}" fill="#{@color}"/>

      #{@tile_elements.map(&:to_s).join("\n")}

      </svg>
    }.gsub(/ +/, ' ')
  end
end

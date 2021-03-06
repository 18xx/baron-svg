class Curve
  def initialize(point1, point2, radius, direction = 0)
    @point1 = point1
    @point2 = point2
    @radius = radius
    @direction = direction
  end

  def centre
    Point.new(Tile::WIDTH / 2, Tile::HEIGHT / 2)
  end

  def to_s
    %{
      <path
        d="M#{@point1.x.round} #{@point1.y.round} A #{@radius.round} #{@radius.round} 0 0,#{@direction} #{@point2.x.round} #{@point2.y.round}"
        fill="none"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 7}"
      />
    }
  end
end


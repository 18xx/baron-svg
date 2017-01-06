class TrackToPoint
  attr_reader :rad

  def initialize(rad, point = Tile::CENTER)
    @rad = rad
    @point = point
  end

  def midpoints(n)
    [
      {
        point: Point.new(
          (radian_point.x + @point.x) / 2,
          (radian_point.y + @point.y) / 2,
        ),
        label_point: Point.new(
          (radian_point.x + @point.x) / 2,
          (radian_point.y + @point.y) / 2,
        )
      }
    ]
  end

  def to_s
    Line.new(
      radian_point,
      @point
    ).to_s
  end

  def radian_point
    Point.new(
      Tile::CENTER.x + Math.cos(@rad) * radius,
      Tile::CENTER.y - Math.sin(@rad) * radius,
    )
  end

  def radius
    Tile::WIDTH / 2
  end
end

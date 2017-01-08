class DoubleOCities < City
  def to_s
    @tile.tile_elements.select do |te|
      te.is_a?(Track)
    end.map do |track|
      point = if track.half
        track.start_point
      else
        track.midpoints(1).first[:point]
      end
      if @spots == 2
        city_circle(point) +
        city_circle(Point.new(
          point.x + city_radius * 1.75,
          point.y + city_radius
        ))
      else
        city_circle(point)
      end
    end.join + cities
  end

  def cities
    %{
      <circle
        cx="#{center.x}"
        cy="#{center.y}"
        r="#{Tile::OFFSET * 9}"
        fill="white"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 2}"
      />
      <text
        x="#{center.x}"
        y="#{center.y + Tile::OFFSET * 4}"
        text-anchor="middle"
        fill="black"
        font-size="#{Tile::OFFSET * 12}"
      >#{@value}</text>
    }
  end
end

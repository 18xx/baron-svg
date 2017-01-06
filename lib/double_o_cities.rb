class DoubleOCities < City
  def to_s
    @tile.tile_elements.select do |te|
      te.is_a?(Track)
    end.map do |track|
      midpoint = track.midpoints(1).first
      if @spots == 2
        city_circle(midpoint[:point]) +
        city_circle(Point.new(
          midpoint[:point].x + city_radius * 1.75,
          midpoint[:point].y + city_radius
        ))
      else
        city_circle(midpoint[:point])
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

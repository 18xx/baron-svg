class City
  def initialize(centre, value)
    @centre = centre
    @value = value
  end

  def offset
    Tile::OFFSET * 24
  end

  def offset_x
    if off_tile?
      -offset * 1.5
    else
      -offset
    end
  end

  def offset_y
    if off_tile?
      offset
    else
      2 * -offset
    end
  end

  def to_s
    %{
      <circle
        cx="#{@centre.x}"
        cy="#{@centre.y}"
        r="#{Tile::OFFSET * 24}"
        fill="white"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 3}"
      />
      <circle
        cx="#{@centre.x + offset_x}"
        cy="#{@centre.y + offset_y}"
        r="#{Tile::OFFSET * 12}"
        fill="none"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 2}"
      />
      <text
        x="#{@centre.x + offset_x}"
        y="#{@centre.y + Tile::OFFSET * 6 + offset_y}"
        text-anchor="middle"
        fill="black"
        font-size="#{Tile::OFFSET * 16}"
      >#{@value}</text>
    }
  end

  private

  def off_tile?
    (@centre.y + 2 * -offset) < 0
  end
end

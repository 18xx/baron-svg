class TileNumber
  def initialize(number, orientation)
    @number = number
    @orientation = orientation
  end

  def to_s
    %{
      <text
        x="#{(Tile::WIDTH * 3 / 4) - Tile::OFFSET * 2}"
        y="#{Tile::HEIGHT - Tile::OFFSET}"
        text-anchor="end"
        fill="black"
        font-size="#{Tile::SIDE_LENGTH / 8}"
      >#{@number}.#{@orientation}</text>
    }
  end
end


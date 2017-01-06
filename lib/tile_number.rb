class TileNumber
  attr_reader :number, :orientation

  def initialize(number, orientation)
    @number = number
    @orientation = orientation
  end

  def to_s
    %{
      <text
        x="#{Tile::WIDTH - Tile::OFFSET}"
        y="#{(Tile::HEIGHT * 3 / 4) - Tile::OFFSET * 2}"
        text-anchor="end"
        fill="black"
        font-size="#{Tile::SIDE_LENGTH / 8}"
      >#{@number}.#{@orientation}</text>
    }
  end
end


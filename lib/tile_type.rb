class TileType
  def initialize(name)
    @name = name
  end

  def to_s
    %{
      <text
        x="#{Tile::OFFSET * 2}"
        y="#{(Tile::HEIGHT * 3 / 4) - Tile::OFFSET * 2}"
        text-anchor="start"
        fill="black"
        font-size="#{Tile::SIDE_LENGTH / 3}"
        font-weight="bold"
      >#{@name}</text>
    }
  end
end

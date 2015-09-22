class TileType
  def initialize(name)
    @name = name
  end

  def to_s
    %{
      <text
        x="#{(Tile::WIDTH / 4) + Tile::OFFSET * 2}"
        y="#{Tile::HEIGHT - Tile::OFFSET}"
        text-anchor="start"
        fill="black"
        font-size="#{Tile::SIDE_LENGTH / 5}"
        font-weight="bold"
      >#{@name}</text>
    }
  end
end

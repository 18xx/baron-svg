class TileType
  def initialize(name)
    @name = name
  end

  def to_s
    %{
      <text
        x="#{Tile::WIDTH / 2}"
        y="#{Tile::HEIGHT - Tile::OFFSET * 10}"
        text-anchor="middle"
        fill="black"
        font-size="#{Tile::SIDE_LENGTH / 4}"
        font-weight="bold"
      >#{@name}</text>
    }
  end
end

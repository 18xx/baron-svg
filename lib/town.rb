class Town
  def initialize(point, label_point, value: nil)
    @point = point
    @label_point = label_point
    @value = value
  end

  def color
    'black'
  end

  def value
    @value
  end

  def to_s
    %{
      <circle
        cx="#{@point.x}"
        cy="#{@point.y}"
        r="#{Tile::OFFSET * 8}"
        fill="#{color}"
      />
      <text
        x="#{@label_point.x}"
        y="#{@label_point.y + Tile::OFFSET * 4}"
        text-anchor="middle"
        fill="black"
        font-size="#{Tile::OFFSET * 16}"
      >#{value}</text>
    }
  end
end



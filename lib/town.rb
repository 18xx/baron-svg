class Town
  def initialize(point, label_point, value: nil, color: color)
    @point = point
    @label_point = label_point
    @value = value
    @color = color
  end

  def color
    'black'
  end

  def value
    @value
  end

  def to_s
    result = %{
      <circle
        cx="#{@point.x}"
        cy="#{@point.y}"
        r="#{Tile::OFFSET * 10}"
        fill="#{color}"
    }
    if @color
      result += %{
        stroke="#{@color}"
        stroke-width="#{Tile::OFFSET * 2}"
      }
    end
    result += %{
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



class Line < Curve
  def initialize(point1, point2)
    super point1, point2, nil
  end

  def to_s
    %{
      <line
        x1="#{@point1.x}"
        y1="#{@point1.y}"
        x2="#{@point2.x}"
        y2="#{@point2.y}"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 10}"
      />
    }
  end
end

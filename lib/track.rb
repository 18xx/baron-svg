class Track
  attr_reader :half

  def initialize(rad1, rad2, half = false)
    @rad1 = rad1
    @rad2 = rad2
    if rad2 > rad1 && rad2 - rad1 > Math::PI
      @rad1 += Math::PI * 2
    end
    @half = half || false
  end

  def to_s
    if straight?
      Line.new(*track_points).to_s
    else
      Curve.new(
        track_points.first,
        track_points.last,
        track_curve_radius,
        (@rad1 > @rad2 ? 1 : 0)
      ).to_s
    end
  end

  def start_point
    track_points.first
  end

  def midpoints(number)
    if straight?
      diff_x = (track_points.last.x - track_points.first.x) / (number + 1)
      diff_y = (track_points.last.y - track_points.first.y) / (number + 1)

      point = track_points.first
      number.times.map do |n|
        point = Point.new(
          point.x + diff_x,
          point.y + diff_y
        )
        {
          point: point,
          label_point: point
        }
      end
    else
      diff = (track_radians.first - track_radians.last).abs / (number + 1)
      point = track_radians.min
      number.times.map do
        point += diff
        {
          point: radian_point(point, track_curve_radius),
          label_point: radian_point(point, track_curve_radius + Tile::OFFSET * 20)
        }
      end
    end
  end

  private

  def center_radius
    if shallow_curve?
      Tile::WIDTH
    elsif tight_curve?
      Tile::HEIGHT / 2
    elsif straight?
      0
    else
      fail "Unknown Radius"
    end
  end

  def tile_radius
    if shallow_curve? || straight?
      Tile::WIDTH / 2
    elsif tight_curve?
      Tile::HEIGHT / 2
    else
      fail "Unknown radius"
    end
  end

  def track_curve_radius
    if shallow_curve?
      Tile::SIDE_LENGTH * 3 / 2
    elsif tight_curve?
      Tile::SIDE_LENGTH / 2
    elsif straight?
      Tile::WIDTH / 2
    else
      fail "Unknown radius"
    end
  end

  def radian_center
    (@rad1 + @rad2) / 2
  end

  def track_radians
    if straight?
      [@rad1, @rad2]
    elsif shallow_curve? && @rad1 < @rad2 || tight_curve? && @rad2 < @rad1
      result = [@rad1 + (7 * Math::PI / 6), @rad2 + (5 * Math::PI / 6)]
      result[0] -= Math::PI / 3 if @half
      result
    elsif tight_curve? && @rad1 < @rad2 || shallow_curve? && @rad2 < @rad1
      result = [@rad1 + (5 * Math::PI / 6), @rad2 + (7 * Math::PI / 6)]
      result[0] += Math::PI / 3 if @half
      result
    else
      fail "Unknown radius"
    end
  end

  def track_points
    track_radians.map do |r|
      radian_point(r, track_curve_radius)
    end
  end

  def radian_point(r, radius)
    Point.new(
      track_center.x + Math.cos(r) * radius,
      track_center.y - Math.sin(r) * radius,
    )
  end

  def track_center
    Point.new(
      Tile::CENTER.x + Math.cos(radian_center) * center_radius,
      Tile::CENTER.y - Math.sin(radian_center) * center_radius,
    )
  end

  def tight_curve?
    (@rad2 - @rad1).abs.round(8) == (Math::PI / 3).round(8)
  end

  def shallow_curve?
    (@rad2 - @rad1).abs.round(8) == (Math::PI * 4 / 6).round(8) ||
    (@rad2 - @rad1).abs.round(8) == (Math::PI * 8 / 6).round(8)
  end

  def straight?
    (@rad2 - @rad1).abs.round(8) == (Math::PI).round(8)
  end
end

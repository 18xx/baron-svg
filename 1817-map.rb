hexes = {
  a: [20, 28],
  b: (3..27).select(&:odd?),
  c: (4..26).select(&:even?) - [12],
  d: (1..27).select(&:odd?),
  e: (2..22).select(&:even?),
  f: (1..21).select(&:odd?),
  g: (2..20).select(&:even?),
  h: (1..17).select(&:odd?),
  i: (2..16).select(&:even?),
  j: [7, 15]
}

river = [:h3, :g4, :g6, :h7, :h9, :g10, :f11, :e12, :d13]
water = [:b9, :c8, :d7, :h17, :g20, :e22, :d25, :d27, :b27]
mountain = [
  :b25, :c24, :c20, :d19, :e18, :e16, :f15, :g14, :g12, :h15, :h13, :h11, :i12,
  :i10, :i8
]

names = {
  a20: 'Montreal',
  a28: 'Maritime Prov.',
  b5: 'Lansing',
  b13: 'Toronto',
  b17: 'Rochester',
  c8: 'Detroit',
  c14: 'Buffalo',
  c22: 'Albany',
  c26: 'Boston',
  d1: 'Chicago',
  d7: 'Toledo',
  d9: 'Cleveland',
  d19: 'Scranton',
  e22: 'NYC',
  f3: 'Indianapolis',
  f13: 'Pittsburgh',
  f19: 'Philadelphia',
  g6: 'Cincinatti',
  g18: 'Baltimore',
  h1: 'St. Louis',
  h3: 'Louisville',
  h9: 'Charleston',
  i12: 'Blacksburg',
  i16: 'Richmond',
  j7: 'Atlanta',
  j15: 'Raleigh-Durham',
}

red_off_boards = {
  a20: {
    exits: [:se, :sw],
    values: {
      yellow: 20,
      green: 30,
      brown: 50,
      grey: 60
    }
  },
  a28: {
    exits: [:sw],
    values: {
      yellow: 20,
      green: 30,
      brown: 50,
      grey: 60
    }
  },
  d1: {
    exits: [:e, :se],
    values: {
      yellow: 30,
      green: 50,
      brown: 60,
      grey: 80
    }
  },
  h1: {
    exits: [:ne, :e, :se],
    values: {
      yellow: 20,
      green: 30,
      brown: 50,
      grey: 60
    }
  },
  j7: {
    exits: [:ne, :nw],
    values: {
      yellow: 30,
      green: 50,
      brown: 60,
      grey: 80
    }
  },
  j15: {
    exits: [:ne, :nw],
    values: {
      yellow: 20,
      green: 30,
      brown: 50,
      grey: 60
    }
  }
}
SIDE_LENGTH = 64
HEIGHT = 2 * SIDE_LENGTH
WIDTH = (SIDE_LENGTH * Math.sqrt(3)).round
CENTER_X = WIDTH / 2
CENTER_Y = HEIGHT / 2

def off_board_exit(left, x_start, x_dir, top, y_start, y_dir)
  %{<polygon points="
    #{left + x_start + 5 * x_dir * Math.sin(Math::PI / 3)},#{top + y_start - 5 * y_dir * Math.cos(Math::PI / 3)}
    #{left + x_start + - 5 * x_dir * Math.sin(Math::PI / 3)},#{top + y_start + 5 * y_dir * Math.cos(Math::PI / 3)}
    #{left + x_start + 20 * x_dir * Math.cos(Math::PI / 3)},#{top + y_start + 20 * y_dir * Math.sin(Math::PI / 3)}
    " fill="black" />
  }
end

map = %{
  <svg
    xmlns="http://www.w3.org/2000/svg"
    height="#{15.5 * SIDE_LENGTH}"
    width="#{14.5 * WIDTH}">
}

row_num = 0
hexes.each do |row, columns|
  columns.each do |column|
    left = (column - 1) * WIDTH * 0.5
    right = left + WIDTH
    top = row_num * 0.75 * HEIGHT
    bottom = top + HEIGHT
    hex_x_middle = left + 0.5 * WIDTH
    hex_y_middle = top + 0.5 * HEIGHT
    hex_top = top + 0.25 * HEIGHT
    hex_bottom = top + 0.75 * HEIGHT
    hex_points = [
      "#{left},#{hex_top}",
      "#{hex_x_middle},#{top}",
      "#{right},#{hex_top}",
      "#{right},#{hex_bottom}",
      "#{hex_x_middle},#{bottom}",
      "#{left},#{hex_bottom}"
    ]
    hex = "#{row}#{column}".to_sym
    fill = '#efe'
    fill = 'red' if red_off_boards.keys.include?(hex)
    map += %{<polygon points="#{hex_points.join ' '}" fill="#{fill}" stroke="black"/>}
    if names[hex]
      y = hex_bottom + 4
      y = hex_bottom - 15 if red_off_boards[hex]
      map += %{<text text-anchor="middle" x="#{hex_x_middle}" y="#{y}">#{names[hex]}</text>}
    end
    if red_off_boards[hex]
      map += %{
        <g>
          <rect x="#{left + CENTER_X - 40}" y="#{top + CENTER_Y - 25}" width="20" height="20" fill="yellow" stroke="black" />
          <text text-anchor="middle" x="#{left + CENTER_X - 30}" y="#{top + CENTER_Y - 10}">#{red_off_boards[hex][:values][:yellow]}</text>
          <rect x="#{left + CENTER_X - 20}" y="#{top + CENTER_Y - 25}" width="20" height="20" fill="green" stroke="black" />
          <text text-anchor="middle" x="#{left + CENTER_X - 10}" y="#{top + CENTER_Y - 10}">#{red_off_boards[hex][:values][:green]}</text>
          <rect x="#{left + CENTER_X}" y="#{top + CENTER_Y - 25}" width="20" height="20" fill="brown" stroke="black" />
          <text text-anchor="middle" x="#{left + CENTER_X + 10}" y="#{top + CENTER_Y - 10}">#{red_off_boards[hex][:values][:brown]}</text>
          <rect x="#{left + CENTER_X + 20}" y="#{top + CENTER_Y - 25}" width="20" height="20" fill="gray" stroke="black" />
          <text text-anchor="middle" x="#{left + CENTER_X + 30}" y="#{top + CENTER_Y - 10}">#{red_off_boards[hex][:values][:grey]}</text>
        </g>
      }
      if red_off_boards[hex][:exits].include?(:e)
        map += %{<polygon points="#{right},#{hex_y_middle - 5} #{right},#{hex_y_middle + 5} #{right - 20},#{hex_y_middle}" fill="black" />}
      end
      if red_off_boards[hex][:exits].include?(:w)
        map += %{<polygon points="#{left},#{hex_y_middle - 5} #{left},#{hex_y_middle + 5} #{left + 20},#{hex_y_middle}" fill="black" />}
      end
      if red_off_boards[hex][:exits].include?(:nw)
        map += off_board_exit(left, WIDTH / 4, 1, top, HEIGHT / 8, 1)
      end
      if red_off_boards[hex][:exits].include?(:ne)
        map += off_board_exit(left, WIDTH * 3 / 4, -1, top, HEIGHT / 8, 1)
      end
      if red_off_boards[hex][:exits].include?(:sw)
        map += off_board_exit(left, WIDTH / 4, 1, top, HEIGHT * 7 / 8, -1)
      end
      if red_off_boards[hex][:exits].include?(:se)
        map += off_board_exit(left, WIDTH * 3 / 4, -1, top, HEIGHT * 7 / 8, -1)
      end
    end
    if river.include?(hex)
      map += %{
        <g>
          <rect x="#{hex_x_middle - 10}" y="#{top + 14}" width="20" height="20" fill="#aaf" stroke="#333" />
          <text text-anchor="middle" x="#{hex_x_middle}" y="#{top + 30}">10</text>
        </g>
      }
    end
    if water.include?(hex)
      map += %{
        <g>
          <rect x="#{hex_x_middle - 10}" y="#{top + 14}" width="20" height="20" fill="#88f" stroke="#333" />
          <text text-anchor="middle" x="#{hex_x_middle}" y="#{top + 30}">20</text>
        </g>
      }
    end
    if mountain.include?(hex)
      map += %{
        <g>
          <rect x="#{hex_x_middle - 10}" y="#{top + 14}" width="20" height="20" fill="#f86" stroke="#333" />
          <text text-anchor="middle" x="#{hex_x_middle}" y="#{top + 30}">15</text>
        </g>
      }
    end
    if names[hex] && !red_off_boards[hex]
      map += %{
        <circle
          cx="#{hex_x_middle}"
          cy="#{hex_y_middle}"
          r="19"
          fill="white"
          stroke="#000"
          stroke-width="2"
        />
      }
    end
  end
  row_num += 1
end

map += %{</svg>}

File.open('build/map.html', 'w') do |file|
  file.write "<html><body>#{map.to_s}</body></html>"
end

class Grid

  GRID_MAPPING = {0 => "0,0",
                  1 => "0,1",
                  2 => "0,2",
                  3 => "1,0",
                  4 => "1,1",
                  5 => "1,2",
                  6 => "2,0",
                  7 => "2,1",
                  8 => "2,2"}

  attr_accessor :array
  def initialize
    @array = []
    prepare_grid
  end

  def prepare_grid
    i = 3
    3.times do
      while i > 0 do
        @array << Array.new(3, "*")
        i -= 1
      end
    end
  end

  def pretty_print
    @array.each_with_index do |row, i|
      row.each_with_index do |col, j|
        print "#{@array[i][j]} | "
      end
      print "\n"
      puts "____________"
    end
  end

  def mapper(turn, player)
    mapping = GRID_MAPPING[turn]
    col, row = mapping.split(',').map {|data| data.to_i}
    array[col][row] = player.token
  end

end
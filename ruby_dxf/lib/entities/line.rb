# lib/entities/line.rb
module RubyDXF
  class Line
    attr_accessor :start_point, :end_point, :layer

    def initialize(start_point, end_point, layer = '0')
      @start_point = start_point
      @end_point = end_point
      @layer = layer
    end

    def to_dxf
      "0\nLINE\n8\n#{@layer}\n10\n#{@start_point[0]}\n20\n#{@start_point[1]}\n30\n#{@start_point[2]}\n11\n#{@end_point[0]}\n21\n#{@end_point[1]}\n31\n#{@end_point[2]}\n"
    end
  end
end

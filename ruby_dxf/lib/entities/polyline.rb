# lib/entities/polyline.rb
module RubyDXF
  class Polyline
    attr_accessor :points, :layer

    def initialize(points, layer = '0')
      @points = points
      @layer = layer
    end

    def to_dxf
      "0\nPOLYLINE\n8\n#{@layer}\n" +
        @points.map { |point| "10\n#{point[0]}\n20\n#{point[1]}\n30\n#{point[2]}\n" }.join +
        "0\nSEQEND\n"
    end
  end
end

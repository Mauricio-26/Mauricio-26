# lib/entities/circle.rb
module RubyDXF
  class Circle
    attr_accessor :center, :radius, :layer

    def initialize(center, radius, layer = '0')
      @center = center
      @radius = radius
      @layer = layer
    end

    def to_dxf
      "0\nCIRCLE\n8\n#{@layer}\n10\n#{@center[0]}\n20\n#{@center[1]}\n30\n#{@center[2]}\n40\n#{@radius}\n"
    end
  end
end

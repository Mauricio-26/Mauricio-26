# lib/entities/text.rb
module RubyDXF
  class Text
    attr_accessor :position, :height, :value, :layer

    def initialize(position, height, value, layer = '0')
      @position = position
      @height = height
      @value = value
      @layer = layer
    end

    def to_dxf
      "0\nTEXT\n8\n#{@layer}\n10\n#{@position[0]}\n20\n#{@position[1]}\n30\n#{@position[2]}\n40\n#{@height}\n1\n#{@value}\n"
    end
  end
end

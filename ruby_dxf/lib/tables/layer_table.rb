# lib/tables/layer_table.rb
module RubyDXF
  class Layer
    attr_accessor :name, :color, :line_type

    def initialize(name, color = 7, line_type = 'Continuous')
      @name = name
      @color = color
      @line_type = line_type
    end

    def to_dxf
      "0\nLAYER\n2\n#{@name}\n62\n#{@color}\n6\n#{@line_type}\n"
    end
  end
end

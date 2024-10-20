# lib/tables/block_table.rb
module RubyDXF
  class Block
    attr_accessor :name, :entities

    def initialize(name)
      @name = name
      @entities = []
    end

    def add_entity(entity)
      @entities << entity
    end

    def to_dxf
      "0\nBLOCK\n2\n#{@name}\n" +
        @entities.map(&:to_dxf).join("\n") +
        "0\nENDBLK\n"
    end
  end
end

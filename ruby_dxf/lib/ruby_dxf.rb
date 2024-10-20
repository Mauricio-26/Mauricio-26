# lib/ruby_dxf.rb
require_relative 'header'
require_relative 'writer'
require_relative 'reader'
require_relative 'entities/line'
require_relative 'entities/circle'
require_relative 'entities/arc'
require_relative 'entities/text'
require_relative 'entities/polyline'
require_relative 'tables/layer_table'
require_relative 'tables/block_table'

module RubyDXF
  # Punto de entrada para la manipulación de archivos DXF
  class Document
    attr_reader :entities, :layers, :blocks, :header

    def initialize
      @entities = []
      @layers = []
      @blocks = []
      @header = Header.new
    end

    def add_entity(entity)
      @entities << entity
    end

    def add_layer(layer)
      @layers << layer
    end

    def add_block(block)
      @blocks << block
    end

    def write_to_file(file_path)
      writer = Writer.new(self)
      writer.write(file_path)
    end

    def self.read_from_file(file_path)
      reader = Reader.new
      reader.read(file_path)
    end
  end
end

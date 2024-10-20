# lib/entities/block.rb
module RubyDXF
  class Block
    attr_accessor :name, :base_point, :entities

    def initialize(name, base_point = [0.0, 0.0, 0.0])
      @name = name
      @base_point = base_point # El punto base del bloque
      @entities = []           # Entidades que componen el bloque
    end

    # Añadir una entidad al bloque
    def add_entity(entity)
      @entities << entity
    end

    # Convierte el bloque a formato DXF
    def to_dxf
      dxf_output = []

      # Inicio del bloque
      dxf_output << '0'
      dxf_output << 'BLOCK'
      dxf_output << '8'
      dxf_output <<

# lib/entities/arc.rb
module RubyDXF
  class Arc
    attr_accessor :center, :radius, :start_angle, :end_angle, :layer

    def initialize(center, radius, start_angle, end_angle, layer = '0')
      @center = center      # Coordenadas [x, y, z] del centro del arco
      @radius = radius      # Radio del arco
      @start_angle = start_angle  # Ángulo inicial en grados
      @end_angle = end_angle      # Ángulo final en grados
      @layer = layer        # Capa en la que está el arco
    end

    # Convierte el arco a formato DXF
    def to_dxf
      dxf_output = []
      dxf_output << '0'
      dxf_output << 'ARC'
      dxf_output << '8'
      dxf_output << @layer
      dxf_output << '10'
      dxf_output << @center[0].to_s
      dxf_output << '20'
      dxf_output << @center[1].to_s
      dxf_output << '30'
      dxf_output << @center[2].to_s
      dxf_output << '40'
      dxf_output << @radius.to_s
      dxf_output << '50'
      dxf_output << @start_angle.to_s
      dxf_output << '51'
      dxf_output << @end_angle.to_s
      dxf_output.join("\n")
    end
  end
end

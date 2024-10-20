# lib/tables/line_style_table.rb
module RubyDXF
  class LineStyle
    attr_accessor :name, :description, :pattern

    def initialize(name, description, pattern)
      @name = name
      @description = description
      @pattern = pattern # Array de números que define el patrón de línea
    end

    def to_dxf
      dxf_output = []
      dxf_output << '0'
      dxf_output << 'LTYPE'
      dxf_output << '2'
      dxf_output << @name
      dxf_output << '3'
      dxf_output << @description
      dxf_output << '72'
      dxf_output << '65' # ASCII de 'A'
      dxf_output << '73'
      dxf_output << @pattern.size.to_s # Número de elementos en el patrón
      dxf_output << '40'
      dxf_output << pattern_length.to_s # Longitud total del patrón
      @pattern.each do |segment|
        dxf_output << '49'
        dxf_output << segment.to_s
      end
      dxf_output.join("\n")
    end

    private

    # Calcula la longitud total del patrón de línea
    def pattern_length
      @pattern.inject(0) { |sum, segment| sum + segment.abs }
    end
  end

  class LineStyleTable
    attr_accessor :styles

    def initialize
      @styles = {}
      add_default_styles
    end

    # Añade un nuevo estilo de línea a la tabla
    def add_style(name, description, pattern)
      @styles[name] = LineStyle.new(name, description, pattern)
    end

    # Encuentra un estilo de línea por su nombre
    def find_style(name)
      @styles[name]
    end

    # Convierte la tabla de estilos de línea en formato DXF
    def to_dxf
      dxf_output = []
      dxf_output << '0'
      dxf_output << 'TABLE'
      dxf_output << '2'
      dxf_output << 'LTYPE'
      dxf_output << '70'
      dxf_output << @styles.size.to_s

      @styles.each_value do |style|
        dxf_output << style.to_dxf
      end

      dxf_output << '0'
      dxf_output << 'ENDTAB'
      dxf_output.join("\n")
    end

    private

    # Añade estilos de línea por defecto (sólido, discontinuo, punteado, etc.)
    def add_default_styles
      add_style('CONTINUOUS', 'Solid line', [1.0])
      add_style('DASHED', 'Dashed line', [0.5, -0.25])
      add_style('DOTTED', 'Dotted line', [0.1, -0.1])
      add_style('CENTER', 'Center line', [1.25, -0.25, 0.25, -0.25])
    end
  end
end

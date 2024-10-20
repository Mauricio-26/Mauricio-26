# test_dxf.rb

require_relative 'lib/entities/line'
require_relative 'lib/entities/arc'
require_relative 'lib/entities/block'
require_relative 'lib/reader'
require_relative 'lib/writer'

# Crear algunas entidades
line1 = RubyDXF::Line.new([0.0, 0.0, 0.0], [10.0, 10.0, 0.0], '0')
arc1 = RubyDXF::Arc.new([5.0, 5.0, 0.0], 5.0, 0.0, 180.0, '0')
block1 = RubyDXF::Block.new('MyBlock', [[0, 0], [10, 0], [10, 10], [0, 10]], '0')

# Generar la salida DXF
dxf_output = []
dxf_output << line1.to_dxf
dxf_output << arc1.to_dxf
dxf_output << block1.to_dxf

# Guardar el archivo DXF
File.open('output.dxf', 'w') do |file|
  file.puts dxf_output.join("\n")
end

puts "Archivo DXF generado: output.dxf"

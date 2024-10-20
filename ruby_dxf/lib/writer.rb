# lib/writer.rb
module RubyDXF
  class Writer
    def initialize(document)
      @document = document
    end

    def write(file_path)
      File.open(file_path, 'w') do |file|
        file.puts '0'
        file.puts 'SECTION'
        file.puts '2'
        file.puts 'HEADER'
        file.puts "9\n$ACADVER\n1\n#{@document.header.version}\n"
        file.puts '0'
        file.puts 'ENDSEC'

        file.puts '0'
        file.puts 'SECTION'
        file.puts '2'
        file.puts 'TABLES'
        @document.layers.each { |layer| file.puts layer.to_dxf }
        file.puts '0'
        file.puts 'ENDSEC'

        file.puts '0'
        file.puts 'SECTION'
        file.puts '2'
        file.puts 'BLOCKS'
        @document.blocks.each { |block| file.puts block.to_dxf }
        file.puts '0'
        file.puts 'ENDSEC'

        file.puts '0'
        file.puts 'SECTION'
        file.puts '2'
        file.puts 'ENTITIES'
        @document.entities.each { |entity| file.puts entity.to_dxf }
        file.puts '0'
        file.puts 'ENDSEC'

        file.puts '0'
        file.puts 'EOF'
      end
    end
  end
end

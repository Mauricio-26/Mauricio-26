# lib/reader.rb
module RubyDXF
  class Reader
    def initialize
      @document = RubyDXF::Document.new
      @current_section = nil
    end

    def read(file_path)
      File.open(file_path, 'r') do |file|
        while (line = file.gets)
          line.strip!
          case line
          when '0'
            parse_next(file)
          when 'SECTION'
            @current_section = parse_section(file)
          when 'ENDSEC'
            @current_section = nil
          end
        end
      end
      @document
    end

    private

    def parse_next(file)
      entity_type = file.gets.strip
      case entity_type
      when 'HEADER'
        parse_header(file)
      when 'TABLES'
        parse_tables(file)
      when 'BLOCKS'
        parse_blocks(file)
      when 'ENTITIES'
        parse_entities(file)
      end
    end

    def parse_section(file)
      section_name = file.gets.strip
      section_name
    end

    def parse_header(file)
      while (line = file.gets.strip)
        break if line == 'ENDSEC'
        case line
        when '9'
          key = file.gets.strip
          if key == '$ACADVER'
            file.gets.strip # ignore next line indicator
            @document.header.version = file.gets.strip
          end
        end
      end
    end

    def parse_tables(file)
      while (line = file.gets.strip)
        break if line == 'ENDSEC'
        case line
        when '0'
          next_table = file.gets.strip
          case next_table
          when 'LAYER'
            parse_layer(file)
          end
        end
      end
    end

    def parse_layer(file)
      layer_name = nil
      color = nil
      line_type = nil
      while (line = file.gets.strip)
        break if line == '0'
        case line
        when '2'
          layer_name = file.gets.strip
        when '62'
          color = file.gets.strip.to_i
        when '6'
          line_type = file.gets.strip
        end
      end
      layer = RubyDXF::Layer.new(layer_name, color, line_type)
      @document.add_layer(layer)
    end

    def parse_blocks(file)
      block_name = nil
      entities = []
      while (line = file.gets.strip)
        break if line == 'ENDSEC'
        case line
        when '0'
          next_entry = file.gets.strip
          if next_entry == 'BLOCK'
            block_name = nil
            entities = []
          elsif next_entry == 'ENDBLK'
            block = RubyDXF::Block.new(block_name)
            entities.each { |entity| block.add_entity(entity) }
            @document.add_block(block)
          else
            entity = parse_entity(next_entry, f

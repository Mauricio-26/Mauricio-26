# tests/test_writer.rb
require 'minitest/autorun'
require_relative '../lib/ruby_dxf'

class TestWriter < Minitest::Test
  def setup
    @document = RubyDXF::Document.new
    @line = RubyDXF::Line.new([0, 0, 0], [100, 100, 0])
    @document.add_entity(@line)
    @file_path = 'output.dxf'
  end

  def test_write_file
    @document.write_to_file(@file_path)
    assert File.exist?(@file_path)
  end

  def test_write_entities
    @document.write_to_file(@file_path)
    content = File.read(@file_path)
    assert content.include?('LINE')
    assert content.include?('10\n0\n20\n0\n30\n0\n11\n100\n21\n100\n31\n0')
  end

  def teardown
    File.delete(@file_path) if File.exist?(@file_path)
  end
end

# tests/test_reader.rb
require 'minitest/autorun'
require_relative '../lib/ruby_dxf'

class TestReader < Minitest::Test
  def setup
    @file_path = 'test_file.dxf'
    @document = RubyDXF::Document.read_from_file(@file_path)
  end

  def test_read_header
    assert_equal 'AC1021', @document.header.version
  end

  def test_read_entities
    assert @document.entities.size > 0
    line = @document.entities.find { |e| e.is_a?(RubyDXF::Line) }
    assert_equal [0, 0, 0], line.start_point
    assert_equal [100, 100, 0], line.end_point
  end

  def test_read_layers
    assert_equal 1, @document.layers.size
    assert_equal '0', @document.layers.first.name
  end
end

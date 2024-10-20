# tests/test_entities.rb
require 'minitest/autorun'
require_relative '../lib/ruby_dxf'

class TestEntities < Minitest::Test
  def test_create_line
    line = RubyDXF::Line.new([0, 0, 0], [100, 100, 0])
    assert_equal [0, 0, 0], line.start_point
    assert_equal [100, 100, 0], line.end_point
  end

  def test_create_circle
    circle = RubyDXF::Circle.new([50, 50, 0], 25)
    assert_equal [50, 50, 0], circle.center
    assert_equal 25, circle.radius
  end

  def test_create_polyline
    polyline = RubyDXF::Polyline.new([[0, 0, 0], [100, 0, 0], [100, 100, 0]])
    assert_equal 3, polyline.points.size
    assert_equal [100, 100, 0], polyline.points.last
  end

  def test_create_text
    text = RubyDXF::Text.new([10, 10, 0], 5, 'Hello World')
    assert_equal 'Hello World', text.value
    assert_equal 5, text.height
  end
end

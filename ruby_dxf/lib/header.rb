# lib/header.rb
module RubyDXF
  class Header
    attr_accessor :version, :tolerances

    def initialize
      @version = 'AC1021' # DXF 2018
      @tolerances = { max: 0.001, min: 0.0001 }
    end
  end
end

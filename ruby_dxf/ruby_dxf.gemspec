# ruby_dxf.gemspec

Gem::Specification.new do |spec|
  spec.name          = 'ruby_dxf'
  spec.version       = '0.1.0'
  spec.authors       = ['MJ']
  spec.email         = ['example@mail.com'] # Reemplaza con tu email

  spec.summary       = 'Una biblioteca para manejar archivos DXF en Ruby'
  spec.description   = 'RubyDXF es una gem para crear y manipular archivos DXF, similar a ezdxf en Python.'
  spec.homepage      = 'https://github.com/Mauricio-26/Mauricio-26' # Reemplaza con la URL de tu proyecto, si tienes
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*', 'LICENSE', 'README.md']
  spec.require_paths  = ['lib']

  spec.add_runtime_dependency 'other_dependencies_here' # Agrega otras dependencias si es necesario
end

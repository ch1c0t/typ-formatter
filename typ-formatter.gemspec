Gem::Specification.new do |g|
  g.name    = 'typ-formatter'
  g.files   = 'lib/typ/formatter.rb'
  g.version = '0.1.3'
  g.summary = 'To format validations made with typs.'
  g.authors = ['Anatoly Chernov']
  g.email   = ['chertoly@gmail.com']

  g.add_dependency 'typ', '>= 0.1.2'
  g.add_dependency 'rainbow', '~> 3.1.1'
  g.add_dependency 'string-indent', '~> 0.0.1'
  g.add_dependency 'awesome_print', '~> 1.9.2'
end

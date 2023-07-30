Gem::Specification.new do |g|
  g.name    = 'typ-formatter'
  g.files   = 'lib/typ/formatter.rb'
  g.version = '0.0.2'
  g.summary = 'To format validations made with typs.'
  g.authors = ['Anatoly Chernov']
  g.email   = ['chertoly@gmail.com']

  g.add_dependency 'rainbow'
  g.add_dependency 'string-indent'
  g.add_dependency 'awesome_print'
end

Gem::Specification.new do |g|
  g.name    = 'typ-formatter'
  g.files   = 'lib/typ/formatter.rb'
  g.version = '0.0.2'
  g.summary = 'A formatter to create nice-looking strings from Typs.'
  g.authors = ['Anatoly Chernow']

  g.add_dependency 'rainbow'
  g.add_dependency 'string-indent'
end

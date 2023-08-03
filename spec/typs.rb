require 'typ'

Dir["#{__dir__}/typs/*.rb"].each do |file|
  body = IO.read file
  name = File.basename file, '.rb'

  eval %!
    class #{name}
      include Typ
      #{body}
    end
  !
end

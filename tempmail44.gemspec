Gem::Specification.new do |s|
  s.name = 'tempmail44'
  s.version = '0.1.0'
  s.summary = 'Uses the Temp Mail API to create a temporary email address.'
  s.authors = ['James Robertson']
  s.files = Dir["lib/tempmail44.rb"]
  s.signing_key = '../privatekeys/tempmail44.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/tempmail44'
end

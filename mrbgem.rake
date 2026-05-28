MRuby::Gem::Specification.new('mruby-require') do |spec|
  spec.license = 'MIT'
  spec.authors = 'mattn'

  spec.linker.libraries << ['dl'] unless for_windows?
end

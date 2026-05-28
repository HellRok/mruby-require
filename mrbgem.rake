MRuby::Gem::Specification.new('mruby-require') do |spec|
  spec.license = 'MIT'
  spec.authors = 'mattn'
  ENV["MRUBY_REQUIRE"] = ""

  is_vc = ENV['OS'] == 'Windows_NT' && cc.command =~ /^cl(\.exe)?$/
  is_mingw = ENV['OS'] == 'Windows_NT' && cc.command =~ /^gcc(.*\.exe)?$/

  unless spec.cc.flags.flatten.find {|e| e.match /DMRBGEMS_ROOT/}
    if RUBY_PLATFORM.downcase !~ /mswin(?!ce)|mingw|bccwin/
      spec.linker.libraries << ['dl']
    end
  end
end

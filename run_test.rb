#!/usr/bin/env ruby

if __FILE__ == $0
  this_file = File.expand_path __FILE__
  repository, dir = 'https://github.com/mruby/mruby.git', 'tmp/mruby'
  build_args = ARGV

  Dir.mkdir 'tmp'  unless File.exist?('tmp')
  unless File.exist?(dir)
    system "git clone #{repository} #{dir}"
  end
  Dir.chdir dir
  system "git checkout 4.0.0"

  exit system(%Q[MRUBY_CONFIG=#{this_file} ruby minirake #{build_args.join(' ')}])
end

MRuby::Lockfile.disable rescue nil # for development

MRuby::Build.new do |conf|
  toolchain :clang
  conf.enable_debug
  conf.enable_test
  conf.gembox 'default'
  conf.gem File.dirname(File.expand_path(__FILE__))
end

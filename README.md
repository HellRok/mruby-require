# mruby-require

> [!NOTE]
> HellRok has removed the ability to package other gems as `.so` files using
> mruby build. It now no longer matters what order you add the mruby-require
> dependency.

mruby-require adds require support to mruby.
This is based on mattn's mruby-require: https://github.com/mattn/mruby-require

## install by mrbgems
```ruby
MRuby::Build.new do |conf|
  conf.gem :github => 'mattn/mruby-require'
end
```

## License

MIT

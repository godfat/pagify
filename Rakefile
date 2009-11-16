# encoding: utf-8

SUDO = '' # this prevent `rake gem:install` to use sudo

require 'bones'
Bones.setup

PROJ.name = 'pagify'
PROJ.authors = 'Lin Jen-Shin (aka godfat 真常)'
PROJ.email = 'godfat (XD) godfat.org'
PROJ.url = "http://github.com/godfat/#{PROJ.name}"
PROJ.rubyforge.name = 'ludy'

PROJ.gem.development_dependencies << ['dm-core',       '>=0.10.1'] <<
                                     ['dm-aggregates', '>=0.10.1'] <<
                                     ['activerecord',  '>=2.3.4']

# supress warnings, there's too many warnings in dm-core
PROJ.ruby_opts.delete '-w'

PROJ.description = PROJ.summary = paragraphs_of('README', 'description').join("\n\n")
PROJ.changes = paragraphs_of('CHANGES', 0..1).join("\n\n")
PROJ.version = File.read("lib/#{PROJ.name}/version.rb").gsub(/.*VERSION = '(.*)'.*/m, '\1')

PROJ.exclude += ['^tmp', 'tmp$', '^pkg', '^\.gitignore$',
                 '^ann-', '\.sqlite3$', '\.db$']

PROJ.rdoc.remote_dir = PROJ.name

PROJ.readme_file = 'README'
PROJ.rdoc.main = 'README'
PROJ.rdoc.exclude += ['Rakefile', '^tasks', '^test']
PROJ.rdoc.include << '\w+'
# PROJ.rdoc.opts << '--diagram' if !Rake::WIN32 and `which dot` =~ %r/\/dot/
PROJ.rdoc.opts += ['--charset=utf-8', '--inline-source',
                   '--line-numbers', '--promiscuous']

PROJ.spec.opts << '--color'

PROJ.ann.file = "ann-#{PROJ.name}-#{PROJ.version}"
PROJ.ann.paragraphs.concat %w[LINKS SYNOPSIS REQUIREMENTS INSTALL LICENSE]

CLEAN.include Dir['**/*.rbc']

task :default do
  Rake.application.options.show_task_pattern = /./
  Rake.application.display_tasks_and_comments
end

namespace :gem do
  desc "create #{PROJ.name}.gemspec"
  task 'gemspec' do
    puts "rake gem:debug > #{PROJ.name}.gemspec"
    File.open("#{PROJ.name}.gemspec", 'w'){|spec| spec << `rake gem:debug`.sub(/.*/, '')}
  end
end

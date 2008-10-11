# encoding: utf-8
# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.
load 'tasks/setup.rb'
ensure_in_path 'lib'

require 'pagify'

CLEAN.include Dir['**/*.rbc']

task :default do
  Rake.application.options.show_task_pattern = /./
  Rake.application.display_tasks_and_comments
end

namespace :gem do
  desc 'create pagify.gemspec'
  task 'gemspec' do
    puts 'rake gem:debug > pagify.gemspec'
    File.open('pagify.gemspec', 'w'){|spec| spec << `rake gem:debug`.sub(/.*/, '')}
  end
end

PROJ.name = 'pagify'
PROJ.authors = 'Lin Jen-Shin (a.k.a. godfat 真常)'
PROJ.email = 'godfat (XD) godfat.org'
PROJ.url = 'http://github.com/godfat/pagify'
PROJ.description = PROJ.summary = paragraphs_of('README', 'description').join("\n\n")
PROJ.changes = paragraphs_of('CHANGES', 0..1).join("\n\n")
PROJ.rubyforge.name = 'ludy'
PROJ.version = File.read('lib/pagify/version.rb').gsub(/.*VERSION = '(.*)'.*/m, '\1')

# PROJ.gem.dependencies << ['dm-core', '>=0.9.3']
# PROJ.gem.executables = ['bin/pagify']
# PROJ.gem.files = []

PROJ.manifest_file = 'Manifest'
PROJ.exclude += ['Manifest', '^tmp', 'tmp$', '^pkg', '.gitignore', '^ann-']

PROJ.readme_file = 'README'
PROJ.rdoc.main = 'README'
PROJ.rdoc.remote_dir = 'pagify'
PROJ.rdoc.exclude += ['Rakefile', '^tasks', '^test']
PROJ.rdoc.include << '\w+'
PROJ.rdoc.opts << '--diagram' if !WIN32 and `which dot` =~ %r/\/dot/
PROJ.rdoc.opts += ['--charset=utf-8', '--inline-source', 
                   '--line-numbers', '--promiscuous']

PROJ.spec.opts << '--color'

PROJ.ann.file = "ann-pagify-#{PROJ.version}"
PROJ.ann.paragraphs.concat %w[LINKS SYNOPSIS REQUIREMENTS INSTALL LICENSE]

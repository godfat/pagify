
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pagify}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (a.k.a. godfat \347\234\237\345\270\270)"]
  s.date = %q{2008-10-13}
  s.description = %q{}
  s.email = %q{godfat (XD) godfat.org}
  s.extra_rdoc_files = ["CHANGES", "LICENSE", "NOTICE", "README", "TODO", "active_record.sqlite3", "pagify.gemspec"]
  s.files = ["CHANGES", "LICENSE", "NOTICE", "README", "Rakefile", "TODO", "active_record.sqlite3", "lib/pagify.rb", "lib/pagify/adapters/active_record.rb", "lib/pagify/adapters/array.rb", "lib/pagify/adapters/data_mapper.rb", "lib/pagify/ar.rb", "lib/pagify/dm.rb", "lib/pagify/null.rb", "lib/pagify/page.rb", "lib/pagify/pager.rb", "lib/pagify/pagifier.rb", "lib/pagify/version.rb", "pagify.gemspec", "spec/pagify_spec.rb", "spec/spec_helper.rb", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake", "test/helper.rb", "test/suite_for_model.rb", "test/test_active_record.rb", "test/test_array.rb", "test/test_basic.rb", "test/test_data_mapper.rb", "test/test_null.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/godfat/pagify}
  s.rdoc_options = ["--diagram", "--charset=utf-8", "--inline-source", "--line-numbers", "--promiscuous", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ludy}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{}
  s.test_files = ["test/test_active_record.rb", "test/test_array.rb", "test/test_basic.rb", "test/test_data_mapper.rb", "test/test_null.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

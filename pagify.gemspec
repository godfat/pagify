
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pagify}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (a.k.a. godfat \347\234\237\345\270\270)"]
  s.date = %q{2008-12-09}
  s.description = %q{pagination tools for plain Ruby, DataMapper, ActiveRecord, and other ORM.}
  s.email = %q{godfat (XD) godfat.org}
  s.extra_rdoc_files = ["CHANGES", "LICENSE", "NOTICE", "README", "TODO", "pagify.gemspec"]
  s.files = ["CHANGES", "LICENSE", "NOTICE", "README", "Rakefile", "TODO", "lib/pagify.rb", "lib/pagify/active_record.rb", "lib/pagify/array.rb", "lib/pagify/basic.rb", "lib/pagify/data_mapper.rb", "lib/pagify/helpers/abstract.rb", "lib/pagify/helpers/details/setting.rb", "lib/pagify/helpers/details/setup.rb", "lib/pagify/helpers/html.rb", "lib/pagify/null.rb", "lib/pagify/pagers/active_record.rb", "lib/pagify/pagers/array.rb", "lib/pagify/pagers/basic.rb", "lib/pagify/pagers/data_mapper.rb", "lib/pagify/pagers/details/page_accept_string_or_blank.rb", "lib/pagify/pagers/null.rb", "lib/pagify/pages/basic.rb", "lib/pagify/pages/null.rb", "lib/pagify/pagifiers/abstract.rb", "lib/pagify/pagifiers/active_record.rb", "lib/pagify/pagifiers/array.rb", "lib/pagify/pagifiers/data_mapper.rb", "lib/pagify/version.rb", "pagify.gemspec", "spec/pagify_spec.rb", "spec/spec_helper.rb", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake", "test/helper.rb", "test/suite_for_model.rb", "test/test_active_record.rb", "test/test_array.rb", "test/test_basic.rb", "test/test_data_mapper.rb", "test/test_html.rb", "test/test_null.rb", "test/test_pagify.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/godfat/pagify}
  s.rdoc_options = ["--diagram", "--charset=utf-8", "--inline-source", "--line-numbers", "--promiscuous", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ludy}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{pagination tools for plain Ruby, DataMapper, ActiveRecord, and other ORM.}
  s.test_files = ["test/test_active_record.rb", "test/test_array.rb", "test/test_basic.rb", "test/test_data_mapper.rb", "test/test_html.rb", "test/test_null.rb", "test/test_pagify.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.1.0"])
      s.add_development_dependency(%q<minitest>, [">= 1.3.0"])
    else
      s.add_dependency(%q<bones>, [">= 2.1.0"])
      s.add_dependency(%q<minitest>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.1.0"])
    s.add_dependency(%q<minitest>, [">= 1.3.0"])
  end
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pagify}
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (aka godfat 真常)"]
  s.date = %q{2009-11-16}
  s.description = %q{ Pagination tools for Array(or custom class), DataMapper and ActiveRecord
 Helpers for Innate/Ramaze and Rails included.}
  s.email = %q{godfat (XD) godfat.org}
  s.extra_rdoc_files = ["CHANGES", "LICENSE", "NOTICE", "README", "TODO", "pagify.gemspec"]
  s.files = ["CHANGES", "LICENSE", "NOTICE", "README", "Rakefile", "TODO", "lib/pagify.rb", "lib/pagify/active_record.rb", "lib/pagify/array.rb", "lib/pagify/data_mapper.rb", "lib/pagify/helper/abstract.rb", "lib/pagify/helper/detail/setting.rb", "lib/pagify/helper/detail/setup.rb", "lib/pagify/helper/detail/web.rb", "lib/pagify/helper/html.rb", "lib/pagify/helper/innate.rb", "lib/pagify/helper/rails.rb", "lib/pagify/page/basic.rb", "lib/pagify/page/null.rb", "lib/pagify/pager/active_record.rb", "lib/pagify/pager/array.rb", "lib/pagify/pager/basic.rb", "lib/pagify/pager/data_mapper.rb", "lib/pagify/pager/detail/page_accept_string_or_blank.rb", "lib/pagify/pager/null.rb", "lib/pagify/pagifier/abstract.rb", "lib/pagify/pagifier/active_record.rb", "lib/pagify/pagifier/array.rb", "lib/pagify/pagifier/data_mapper.rb", "lib/pagify/version.rb", "pagify.gemspec", "spec/pagify_spec.rb", "spec/spec_helper.rb", "test/helper.rb", "test/helper_model.rb", "test/helper_pagify.rb", "test/helper_web.rb", "test/test_active_record.rb", "test/test_array.rb", "test/test_basic.rb", "test/test_data_mapper.rb", "test/test_html.rb", "test/test_innate.rb", "test/test_null.rb", "test/test_rails.rb"]
  s.homepage = %q{http://github.com/godfat/pagify}
  s.rdoc_options = ["--charset=utf-8", "--inline-source", "--line-numbers", "--promiscuous", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ludy}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Pagination tools for Array(or custom class), DataMapper and ActiveRecord Helpers for Innate/Ramaze and Rails included.}
  s.test_files = ["test/test_active_record.rb", "test/test_array.rb", "test/test_basic.rb", "test/test_data_mapper.rb", "test/test_html.rb", "test/test_innate.rb", "test/test_null.rb", "test/test_rails.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.5.1"])
      s.add_development_dependency(%q<dm-core>, [">= 0.10.1"])
      s.add_development_dependency(%q<dm-aggregates>, [">= 0.10.1"])
      s.add_development_dependency(%q<activerecord>, [">= 2.3.4"])
    else
      s.add_dependency(%q<bones>, [">= 2.5.1"])
      s.add_dependency(%q<dm-core>, [">= 0.10.1"])
      s.add_dependency(%q<dm-aggregates>, [">= 0.10.1"])
      s.add_dependency(%q<activerecord>, [">= 2.3.4"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.5.1"])
    s.add_dependency(%q<dm-core>, [">= 0.10.1"])
    s.add_dependency(%q<dm-aggregates>, [">= 0.10.1"])
    s.add_dependency(%q<activerecord>, [">= 2.3.4"])
  end
end

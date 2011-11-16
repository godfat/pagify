# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pagify"
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2011-11-16"
  s.description = "Pagination tools for Array(or custom class), DataMapper and ActiveRecord.\nHelpers for Innate/Ramaze and Rails included."
  s.email = ["godfat (XD) godfat.org"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  "CHANGES.md",
  "CONTRIBUTORS",
  "Gemfile",
  "LICENSE",
  "README.md",
  "Rakefile",
  "TODO.md",
  "lib/pagify.rb",
  "lib/pagify/active_record.rb",
  "lib/pagify/array.rb",
  "lib/pagify/data_mapper.rb",
  "lib/pagify/helper/abstract.rb",
  "lib/pagify/helper/detail/setting.rb",
  "lib/pagify/helper/detail/setup.rb",
  "lib/pagify/helper/detail/web.rb",
  "lib/pagify/helper/html.rb",
  "lib/pagify/helper/innate.rb",
  "lib/pagify/helper/rails.rb",
  "lib/pagify/page/basic.rb",
  "lib/pagify/page/null.rb",
  "lib/pagify/pager/active_record.rb",
  "lib/pagify/pager/array.rb",
  "lib/pagify/pager/basic.rb",
  "lib/pagify/pager/data_mapper.rb",
  "lib/pagify/pager/detail/page_accept_string_or_blank.rb",
  "lib/pagify/pager/null.rb",
  "lib/pagify/pagifier/abstract.rb",
  "lib/pagify/pagifier/active_record.rb",
  "lib/pagify/pagifier/array.rb",
  "lib/pagify/pagifier/data_mapper.rb",
  "lib/pagify/version.rb",
  "misc.txt",
  "pagify.gemspec",
  "task/.gitignore",
  "task/gemgem.rb",
  "test/helper.rb",
  "test/helper_model.rb",
  "test/helper_pagify.rb",
  "test/helper_web.rb",
  "test/test_active_record.rb",
  "test/test_array.rb",
  "test/test_basic.rb",
  "test/test_data_mapper.rb",
  "test/test_html.rb",
  "test/test_innate.rb",
  "test/test_null.rb",
  "test/test_rails.rb"]
  s.homepage = "https://github.com/godfat/pagify"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Pagination tools for Array(or custom class), DataMapper and ActiveRecord."
  s.test_files = [
  "test/test_active_record.rb",
  "test/test_array.rb",
  "test/test_basic.rb",
  "test/test_data_mapper.rb",
  "test/test_html.rb",
  "test/test_innate.rb",
  "test/test_null.rb",
  "test/test_rails.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

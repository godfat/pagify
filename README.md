# pagify

by Lin Jen-Shin ([godfat](http://godfat.org))

## LINKS:

* [github](https://github.com/godfat/pagify)
* [rubygems](https://rubygems.org/gems/pagify)
* [rdoc](http://rdoc.info/github/godfat/pagify)

## DESCRIPTION:

Pagination tools for Array(or custom class), DataMapper and ActiveRecord.
Helpers for Innate/Ramaze and Rails included.

## REQUIREMENTS:

* Ruby 1.8+ or 1.9.1+
* For  Basic/ArrayPager: only Ruby is needed
* For   DataMapperPager: dm-core and dm-aggregates 1.2+
* for ActiveRecordPager: activerecord 2.3.14+ or activerecord 3.1+
* for     Innate helper: innate 2011.10+

## INSTALLATION:

    gem install pagify

## FEATURES:

* Aims to be as flexible as possible
* Separate intrusive "pagify" method and Array/DataMapper/ActiveRecord Pager.
* Separate view helpers. There's only html helper right now.
* Web framework specific helper included. Currently for Innate/Ramaze and Rails.

## SYNOPSIS:

For fast Rails will_paginate replacement:

    require 'pagify/active_record'
    require 'pagify/helper/rails'

in controller:

    @photos = Photo.pagify(:page => params[:page])

in view:

    pagify_links(@photos)

For Innate/Ramaze:

    require 'pagify'
    require 'pagify/helper/innate'

in controller, say you want pagify helper:

    class Controller < Ramaze::Controller
      helper :pagify
    end

for the data part, see `DataMapperPager` or `ActiveRecordPager` in view,
same as in Rails.

Basic DataMapper usage:

    require 'pagify/data_mapper'

    class User
      include DataMapper::Resource
      property :id, Serial
      property :name, String
      has n, :pets
    end

    class Pet
      include DataMapper::Resource
      property :id, Serial
      property :name, String
      belongs_to :user
    end

    User.pagify :page => 1, :per_page => 10 # => create a page contains users
    User.all(:name => 'godfat').pagify      # => create a page contains users named godfat

    User.get(1).pets.pagify                 # => create a page contains pets owned by user 1

Basic html helper usage:

    require 'pagify/helper/html'

Create a string with page links.

    Pet.pagify.pager.html.links(params[:page]){ |page|
      # the block result would be used as url for each page
      "/pets/list?page=#{page}"
    }

    Pagify::Helper::HTML.setting[:prev_text] = '<]' # globally change html setting

If you would like to use instance level setting, you shouldn't use method
pagify, new your own DataMapperPager or so to remember instance level html
setting. for example, see below:

    class Pet
    # same as above
      def self.page num
        @pager ||= begin
          pager = Pagify::DataMapperPager.new(:per_page => 20)
          # below would be pager instance level setting
          # you can setup global setting mentioned above in your init script perhaps
          pager.html.setting[:separator] = ' . '
          pager.html.setting[:ellipsis]  = '...'
          pager
        end
        @pager.page(num)
      end
    end

Then you would use `Pet.page(3)` or `user.pets.page(2)` to retrieve data.
This would create next/prev links only.

    Pet.page(1).html.links_navigate{ |page|
      "/pets/list?page=#{page}"
    }

This would create next/prev links and other page links

    pet_pager.page(1).html.links_full{ |page|
      "/pets/show?page=#{page}"
    }

and you can build your pager from scratch via BasicPager.
e.g. `BasicPager.new :fetcher => lambda{|*a|[]}, :counter => lambda{0}`
this would be similar to `Pagify::NullPager`.

You can disable null page via passing `:null_page => false` to any pager,
or set `pager.null_page = false` anytime.

See example or test for more examples (and use case for `ActiveRecordPager`).

## LICENSE:

Apache License 2.0

Copyright (c) 2008-2011, Lin Jen-Shin (godfat)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

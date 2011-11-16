# CHANGES

## pagify 0.8.0 / 2011-11-16

Adopt changes from @agios

* Setting `setting[:first_text]` to `nil` would make pagify
  use page number as the first_text. The same goes to
  `setting[:last_text]`

* Added a `<span class="pagination_active">` wrapper for active
  page. You can change the class by changing `setting[:active_class]`

* Now links would by default contain `class="pagination_inactive"`.
  You can also change the class name by changing `setting[:inactive_class]`
  Set it to `nil` would disable this.

* Fixed a deprecation warning on activerecord 3.1.1

## pagify 0.7.1 / 2010-04-26

* fix the problem that RUBY_VERSION is forzen,
  just use lexical string comparsion then.

## pagify 0.7.0 / 2009-11-16

* added innate helper.
* some internal refactoring

## pagify 0.6.2 / 2009-08-08

* no joke now, use pagify_links instead of would_paginate.
* now you can define your own pagify_links and call super
  in ApplicationHelper.
* added a links_type option for rails helper,
  telling which html helper method you would like.
  default to HTML#links_full

## pagify 0.6.1 / 2009-07-30

* first rubyforge gem release!
* rearranged require call.
* use normal form for dir and module name
* removed pagify pager cache, it's not useful
* added rails helper (i.e. would_pagiante)
* fixed that NullPage from pagers other than NullPager,
  it should always acts as an empty array.

### Policy changed

null page was no longer a singleton. see reason below:

i encountered a strange problem, where:

    pager[10].pager.per_page != pager[1].pager.per_page

because BasicPage#pager would refer to original pager,
while NullPage#pager would always refer to NullPager's singleton.

i think i should have not made NullPage be a singleton,
because we got have some way to keep page.pager.per_page
consist to the value we original setup. then we could write
something like this:

    (0...page.pager.per_page).each{ ... }

that is, we don't have to keep pager around, and if you have
page, then you have pager. so now that NullPage was no longer
a singleton, and null_page.pager would return the original pager.

keep NullPager being a singleton though, and it should always
return the same page which refer the singleton null pager.

## pagify 0.5 / 2008-10-11

* 1 major enhancement
  * Birthday!
  * extracted from Ludy::Paginator!


# require 'extlib'

module SuiteForModel

  def test_cache_for_pager
    send(:User).pagify_cache = true

    users1 = send(:User).pagify :page => 1, :per_page => 2
    pager = send(:User).pagify_pager

    users2 = send(:User).pagify :page => 2, :per_page => 2

    # same pager for same opts
    assert_equal users1.pager.object_id, send(:User).pagify_pager.object_id
    assert_equal users2.pager.object_id, send(:User).pagify_pager.object_id

    # opts changed, create a new pager
    assert send(:User).pagify(:per_page => 1).pager.object_id != users1.pager.object_id

    # there's cache
    assert send(:User).pagify_pager != nil

    # cleanup cache
    send(:User).pagify_cache = false
    assert_nil send(:User).pagify_pager
  ensure
    send(:User).pagify_cache = false
  end

  def test_no_cache_for_pager
    assert_nil send(:User).pagify_pager

    users1 = send(:User).pagify :page => 1, :per_page => 2
    pager = send(:User).pagify_pager

    users2 = send(:User).pagify :page => 2, :per_page => 2

    assert_nil send(:User).pagify_pager

    # not same pager for same opts
    assert users1.pager.object_id != send(:User).pagify_pager.object_id
    assert users2.pager.object_id != send(:User).pagify_pager.object_id
  end

  def test_page_correctness
    users = send(:User).pagify :page => 1, :per_page => 2

    assert_equal 2, users.pager.size
    assert_equal 1, users.page
    assert_equal send(:User).first, users.first
    assert_equal 2, users.size
    assert_equal send(:User).first(:offset => 2), users.next.first
    assert_equal 1, users.next.size
    assert_nil users.next.next
  end

  def test_condition_chain
    users_A = send(:User).all(:conditions => ['name = ?', 'A']).pagify :page => 1, :per_page => 1
    assert_equal 1, users_A.size
    assert_equal 2, users_A.pager.entries_count
    assert_equal 2, users_A.pager.size # pages
  end

  def test_association_pagify
    user = send(:User).first
    user.pets.push(*send(:Pet).all)
    assert user.save
    assert_equal 3, user.pets.count

    page = user.pets.pagify :page => 1, :per_page => 1
    assert_equal 1, page.size
  end

  def self.included test_case
    test_case.module_eval do
      # due to ruby const lookup is different from method lookup
      def User; self.class.const_get(:User); end
      def Pet;  self.class.const_get(:Pet); end
    end

    test_case.const_get(:User).module_eval do
      create :name => 'A'
      create :name => 'A'
      create :name => 'B'
    end

    test_case.const_get(:Pet).module_eval do
      create :name => 'Qoo'
      create :name => 'Qooooo'
      create :name => 'godfat'
    end
  end

  # include Extlib::Hook
  #
  # private
  # def i_give_up
  #   if self.class == TestActiveRecord
  #     skip "it's toooooo hard to implement this for active record!! patch wanted!"
  #   end
  # end
  #
  # [:test_same_pager_with_same_opts,
  #  :test_page_correctness,
  #  :test_condition_chain].each{ |test|
  #   before test.to_sym, :i_give_up
  # }

end

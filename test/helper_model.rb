
module SuiteForModel

  def test_page_correctness_fixnum
    page_correctness 1
  end

  def test_page_correctness_string
    page_correctness '1'
  end

  def test_nil_page_default_page_1
    users = send(:User).pagify :page => nil, :per_page => 2
    assert_equal 2, users.pager.size
    assert_equal 1, users.page
  end

  def page_correctness page
    users = send(:User).pagify :page => page, :per_page => 2

    assert_equal 2, users.pager.size
    assert_equal 1, users.page
    assert_equal send(:User).first, users.first
    assert_equal 2, users.size
    assert_equal send(:User).first(:offset => 2, :limit => 1), users.next.first
    assert_equal 1, users.next.size
    assert_equal Pagify::NullPage.new(users.pager), users.next.next
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

    page = all_pets_with_name_godfat(user).pagify :page => 2, :per_page => 1
    assert_equal 1, page.size
    assert_equal 2, page.pager.size
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
      create :name => 'godfat'
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

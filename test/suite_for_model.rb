
require 'extlib'

module SuiteForModel
  def test_same_pager_with_same_opts
    users1 = model.pagify :page => 1, :per_page => 2
    pager = model.pagify_pager

    users2 = model.pagify :page => 2, :per_page => 2

    # same pager for same opts
    assert_equal users1.pager.object_id, model.pagify_pager.object_id
    assert_equal users2.pager.object_id, model.pagify_pager.object_id

    # opts changed, create a new pager
    assert model.pagify(:per_page => 1).pager.object_id != users1.pager.object_id
  end

  def test_page_correctness
    users = model.pagify :page => 1, :per_page => 2

    assert_equal 2, users.pager.size
    assert_equal 1, users.page
    assert_equal model.first, users.first
    assert_equal 2, users.size
    assert_equal model.first(:offset => 2), users.next.first
    assert_equal 1, users.next.size
    assert_nil users.next.next
  end

  def test_condition_chain
    users_A = model.all(:conditions => ['name = ?', 'A']).pagify :page => 1, :per_page => 1
    assert_equal 1, users_A.size
    assert_equal 2, users_A.pager.entries_count
    assert_equal 2, users_A.pager.size # pages
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

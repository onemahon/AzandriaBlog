require 'test_helper'

class JumbotronsHelperTest < ActionView::TestCase
  setup do
    @jumbotron = jumbotrons(:day)
  end

  test 'should return correct jumbotron_text' do
    assert_equal @jumbotron.quote_text_full, jumbotron_text
  end
end

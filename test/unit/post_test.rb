# -*- coding: utf-8 -*-
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save post" do
    assert posts(:valid_post).save
  end
end

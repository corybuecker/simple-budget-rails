# frozen_string_literal: true

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  def build_today_mock(call_count = 1)
    mock = Minitest::Mock.new

    call_count.times do
      mock.expect(:call, Date.new(2022, 4, 18))
    end
    mock
  end

  test 'accumulated amount for past goal' do
    goal = Goal.new(amount: 450, target_date: '2021-12-01', recurrance: 'yearly')
    today = build_today_mock(2)

    Time.zone.stub :today, today do
      assert_equal 450, goal.accumlated_amount
    end
  end

  test 'accumulated amount for nonrecurring goal' do
    goal = Goal.create!(created_at: '2022-04-18', user: users(:one),
                        name: 'tesT', amount: 450, target_date: '2022-12-01', recurrance: 'never')
    today = build_today_mock(3)

    Time.zone.stub :today, today do
      assert_equal 0, goal.accumlated_amount
    end

    assert today.verify
  end

  test 'accumulated amount for annual goal' do
    goal = Goal.new(amount: 450, target_date: '2022-12-01', recurrance: 'yearly')
    today = build_today_mock(3)

    Time.zone.stub :today, today do
      assert_in_delta 170.02, goal.accumlated_amount, 0.10
    end
    assert today.verify
  end

  test 'accumulated amount for monthly goal more than one month in the future' do
    goal = Goal.new(amount: 450, target_date: '2022-06-01', recurrance: 'monthly')
    today = build_today_mock(2)

    Time.zone.stub :today, today do
      assert_equal 0, goal.accumlated_amount
    end
    assert today.verify
  end
end

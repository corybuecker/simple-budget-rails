# frozen_string_literal: true

require 'test_helper'

class MaterialFormBuilderTest < ActionView::TestCase
  def form_with
    @output_buffer = super(model: Account.new, builder: MaterialFormBuilder)
  end

  test 'single button' do
    form_with { |f| f.button('Save') }

    assert_select 'button', 1
  end

  test 'ripple in button' do
    form_with { |f| f.button('Save') }

    assert_select 'button' do
      assert_select 'span.mdc-button__ripple', 1
    end
  end

  test 'string in button' do
    form_with { |f| f.button('test string') }
    assert_select 'button' do
      assert_select 'span.mdc-button__label', 'test string'
    end
  end

  test 'classes on button' do
    form_with { |f| f.button('test string', class: 'extra-class') }
    assert_select 'button.extra-class', 1
  end

  test 'mdc classes on button' do
    form_with { |f| f.button('test string', class: 'extra-class') }
    assert_select 'button.extra-class.mdc-button', 1
  end

  test 'button with block' do
    form_with do |f|
      f.button('test string') do
        'block content'
      end
    end

    assert_select 'button' do
      assert_select 'span.mdc-button__label', 'block content'
    end
  end

  test 'single input' do
    form_with { |f| f.text_field('test') }
    assert_select 'input', 1
  end

  test 'ripple in input' do
    form_with { |f| f.text_field('test') }
    assert_select 'label' do
      assert_select 'span.mdc-text-field__ripple', 1
    end
  end

  test 'string in input' do
    form_with { |f| f.text_field('test string') }
    assert_select 'label' do
      assert_select 'span.mdc-floating-label', 'Test String'
    end
  end

  test 'classes on input' do
    form_with { |f| f.text_field('test string', class: 'extra-class') }
    assert_select 'label.extra-class', 1
  end

  test 'mdc classes on input' do
    form_with { |f| f.text_field('test string', class: 'extra-class') }
    assert_select 'label.extra-class.mdc-text-field', 1
  end
end

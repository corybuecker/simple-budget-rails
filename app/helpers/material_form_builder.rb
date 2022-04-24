# frozen_string_literal: true

class MaterialFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, :button_tag, to: :template

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def radio_button(method, tag_value, options = {})
    tag.div(class: 'mdc-touch-target-wrapper') do
      tag.div(class: 'mdc-form-field', data: { material_form_target: 'radio' }) do
        tag.div(class: 'mdc-radio mdc-radio--touch') do
          super(method, tag_value, options.merge(class: 'mdc-radio__native-control')) +
            tag.div(class: 'mdc-radio__background') do
              tag.div(class: 'mdc-radio__outer-circle') +
                tag.div(class: 'mdc-radio__inner-circle')
            end +
            tag.div(class: 'mdc-radio__ripple')
        end +
          tag.label(for: "#{object_name}_#{method}_#{tag_value}", class: 'mdc-radio__label') do
            options[:label]
          end
      end
    end
  end

  def check_box(method, options = {}, checked_value = '1', unchecked_value = '0')
    tag.div(class: 'mdc-touch-target-wrapper') do
      tag.div(class: 'mdc-form-field', data: { material_form_target: 'checkbox' }) do
        tag.div(class: 'mdc-checkbox mdc-checkbox--touch') do
          super(method, options.merge(class: 'mdc-checkbox__native-control'), checked_value, unchecked_value) +
            tag.div(class: 'mdc-checkbox__background') do
              tag.svg(class: 'mdc-checkbox__checkmark', viewBox: '0 0 24 24') do
                tag.path(class: 'mdc-checkbox__checkmark-path', fill: 'none', d: 'M1.73,12.91 8.1,19.28 22.79,4.59')
              end +
                tag.div(class: 'mdc-checkbox__mixedmark')
            end +
            tag.div(class: 'mdc-radio__ripple')
        end +
          tag.label(for: "#{object_name}_#{method}", class: 'mdc-radio__label') do
            options[:label]
          end
      end
    end
  end

  def date_field(method, options = {}, &)
    input_clasess = String(options[:class]).split + ['mdc-text-field__input']

    generic_textfield_wrapper(method, options) do
      super(method, options.merge(class: input_clasess.compact.uniq.join(' ')), &)
    end
  end

  def number_field(method, options = {}, &)
    input_clasess = String(options[:class]).split + ['mdc-text-field__input']

    generic_textfield_wrapper(method, options) do
      super(method, options.merge(class: input_clasess.compact.uniq.join(' ')), &)
    end
  end

  def text_field(method, options = {}, &)
    input_clasess = String(options[:class]).split + ['mdc-text-field__input']

    generic_textfield_wrapper(method, options) do
      super(method, options.merge(class: input_clasess.compact.uniq.join(' ')), &)
    end
  end

  def button(value = nil, options = {}, &block)
    classes = String(options[:class]).split + ['mdc-button', 'mdc-button--touch']
    options[:class] = classes.compact.uniq.join(' ').strip

    tag.div(class: 'mdc-touch-target-wrapper', data: { material_form_target: 'button' }) do
      button_tag(nil, options) do
        tag.span(class: 'mdc-button__ripple') +
          tag.span(class: 'mdc-button__touch') +
          tag.span(class: 'mdc-button__label') do
            block ? block.call : value
          end
      end
    end
  end

  private

  def generic_textfield_wrapper(method, options = {})
    label_classes = String(options[:class]).split + ['mdc-text-field', 'mdc-text-field--filled']

    options.except!(:class)

    label = options.delete(:label) || method.to_s.titleize
    options[:id] = "#{object_name}_#{method}"
    # Fix for known Safari bug, https://github.com/material-components/material-components-web/issues/5879
    options[:placeholder] = options[:placeholder] || ' '
    options[:aria] = {
      labelledby: options[:id],
      controls: "#{options[:id]}-helper",
      describedby: "#{options[:id]}-helper"
    }
    field_helper_classes = [
      'mdc-text-field-helper-text',
      'mdc-text-field-helper-text--persistent',
      'mdc-text-field-helper-text--validation-msg'
    ]
    tag.div(data: { material_form_target: 'textfield' }) do
      tag.label(class: label_classes.compact.uniq.join(' ').strip) do
        tag.span(class: 'mdc-text-field__ripple') +
          tag.span(class: 'mdc-floating-label', id: options[:id]) do
            label
          end + yield + tag.span(class: 'mdc-line-ripple')
      end +
        content_tag(:div, class: 'mdc-text-field-helper-line', data: { material_form_target: 'textfieldHelper' }) do
          content_tag(:div, class: field_helper_classes, aria: { hidden: true }, id: "#{options[:id]}-helper") do
            @object.errors[method]&.first
          end
        end
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
  attr_reader :template
end

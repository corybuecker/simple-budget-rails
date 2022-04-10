# frozen_string_literal: true

class MaterialFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :button_tag, to: :template

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def number_field(method, options = {})
    label_classes = String(options[:class]).split + ['mdc-text-field', 'mdc-text-field--filled']
    input_clasess = String(options[:class]).split + ['mdc-text-field__input']

    options.except!(:class)

    label = options.delete(:label) || method.to_s.titleize

    # Fix for known Safari bug, https://github.com/material-components/material-components-web/issues/5879
    options[:placeholder] = options[:placeholder] || ' '
    tag.div do
      tag.label(class: label_classes.compact.uniq.join(' ').strip) do
        tag.span(class: 'mdc-text-field__ripple') +
          tag.span(class: 'mdc-floating-label', id: options[:id]) { label } +
          super(method, options.merge(class: input_clasess.compact.uniq.join(' '))) +
          tag.span(class: 'mdc-line-ripple')
      end
    end
  end

  def text_field(method, options = {})
    label_classes = String(options[:class]).split + ['mdc-text-field', 'mdc-text-field--filled']
    input_clasess = String(options[:class]).split + ['mdc-text-field__input']

    options.except!(:class)

    label = options.delete(:label) || method.to_s.titleize

    # Fix for known Safari bug, https://github.com/material-components/material-components-web/issues/5879
    options[:placeholder] = options[:placeholder] || ' '
    tag.div do
      tag.label(class: label_classes.compact.uniq.join(' ').strip) do
        tag.span(class: 'mdc-text-field__ripple') +
          tag.span(class: 'mdc-floating-label', id: options[:id]) { label } +
          super(method, options.merge(class: input_clasess.compact.uniq.join(' '))) +
          tag.span(class: 'mdc-line-ripple')
      end
    end
  end

  def button(value = nil, options = {}, &block)
    classes = String(options[:class]).split + ['mdc-button', 'mdc-button--touch']
    options[:class] = classes.compact.uniq.join(' ').strip

    tag.div(class: 'mdc-touch-target-wrapper') do
      button_tag(nil, options) do
        tag.span(class: 'mdc-button__ripple') +
          tag.span(class: 'mdc-button__touch') +
          tag.span(class: 'mdc-button__label') do
            block ? block.call : value
          end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  attr_reader :template
end

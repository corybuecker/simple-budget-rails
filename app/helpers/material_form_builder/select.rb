# frozen_string_literal: true

class MaterialFormBuilder
  module Select
    def select(method, choices = nil, _options = {}, _html_options = {})
      tag.div(class: 'mdc-select mdc-select--filled', data: { material_form_target: 'select' }) do
        tag.div(class: 'mdc-select__anchor', role: 'button',
                aria: { haspopup: 'listbox', expanded: 'false', labelledby: 'demo-label demo-selected-text' }) do
          tag.span(class: 'mdc-select__ripple') +
            tag.span(class: 'mdc-floating-label', id: 'demo-label') do
              method.to_s.humanize
            end +
            tag.span(class: 'mdc-select__selected-text-container') do
              tag.span(class: 'mdc-select__selected-text')
            end +
            tag.span(class: 'mdc-select__dropdown-icon') do
              tag.svg(class: 'mdc-select__dropdown-icon-graphic', viewBox: '7 10 10 5', focusable: 'false') do
                tag('polygon', { class: 'mdc-select__dropdown-icon-inactive', stroke: 'none', fill_rule: 'evenodd',
                                 points: '7 10 12 15 17 10' }, false) +
                  tag('polygon', { class: 'mdc-select__dropdown-icon-active', stroke: 'none', fill_rule: 'evenodd',
                                   points: '7 15 12 10 17 15' }, false)
              end
            end + tag.div(class: 'mdc-line-ripple')
        end +
          tag.div(class: 'mdc-select__menu mdc-menu mdc-menu-surface') do
            tag.ul(class: 'mdc-deprecated-list', role: 'listbox') do
              choices.reduce do |_acc, (_id, value)|
                concat(
                  tag.li(class: 'mdc-deprecated-list-item') do
                    tag.span(class: 'mdc-deprecated-list-item__ripple') +
                    tag.span(class: 'mdc-deprecated-list-item__text') do
                      value
                    end
                  end
                )
              end
            end
          end
      end
    end
  end
end

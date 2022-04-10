# frozen_string_literal: true

module MaterialTagsHelper
  def material_button_tag(text, controllers: [], actions: [])
    controllers = (controllers + ['material-tags']).uniq.join(' ')

    tag.div(class: 'mdc-touch-target-wrapper', data: { controller: controllers, action: actions.uniq.join(' ') }) do
      content_tag(:button, { class: 'mdc-button mdc-button--raised mdc-button--touch' }) do
        tag.span(class: 'mdc-button__ripple') +
          tag.span(class: 'mdc-button__touch') +
          tag.span(class: 'mdc-button__label') do
            text
          end
      end
    end
  end
end

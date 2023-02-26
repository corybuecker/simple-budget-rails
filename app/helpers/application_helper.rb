# frozen_string_literal: true

module ApplicationHelper
  def navigation_link_to(name = nil, path = nil, html_options = {}, &)
    html_options[:class] = %w[text-white hover:bg-slate-600 px-3 py-2 rounded-md text-sm].join(' ')
    html_options[:class] = %w[bg-slate-600 text-white px-3 py-2 rounded-md text-sm].join(' ') if request.path == path

    link_to(name, path, html_options, &)
  end
end

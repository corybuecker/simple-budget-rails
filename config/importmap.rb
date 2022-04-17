# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin '@material/banner', to: 'https://ga.jspm.io/npm:@material/banner@13.0.0/index.js'
pin '@material/data-table', to: 'https://ga.jspm.io/npm:@material/data-table@13.0.0/index.js'
pin '@material/dialog', to: 'https://ga.jspm.io/npm:@material/dialog@13.0.0/index.js'
pin '@material/ripple', to: 'https://ga.jspm.io/npm:@material/ripple@13.0.0/index.js'
pin '@material/textfield', to: 'https://ga.jspm.io/npm:@material/textfield@13.0.0/index.js'
pin '@material/animation/animationframe', to: 'https://ga.jspm.io/npm:@material/animation@13.0.0/animationframe.js'
pin '@material/animation/util', to: 'https://ga.jspm.io/npm:@material/animation@13.0.0/util.js'
pin '@material/base/component', to: 'https://ga.jspm.io/npm:@material/base@13.0.0/component.js'
pin '@material/base/foundation', to: 'https://ga.jspm.io/npm:@material/base@13.0.0/foundation.js'
pin '@material/checkbox/component', to: 'https://ga.jspm.io/npm:@material/checkbox@13.0.0/component.js'
pin '@material/dom/events', to: 'https://ga.jspm.io/npm:@material/dom@13.0.0/events.js'
pin '@material/dom/focus-trap', to: 'https://ga.jspm.io/npm:@material/dom@13.0.0/focus-trap.js'
pin '@material/dom/ponyfill', to: 'https://ga.jspm.io/npm:@material/dom@13.0.0/ponyfill.js'
pin '@material/floating-label/component', to: 'https://ga.jspm.io/npm:@material/floating-label@13.0.0/component.js'
pin '@material/floating-label/foundation', to: 'https://ga.jspm.io/npm:@material/floating-label@13.0.0/foundation.js'
pin '@material/line-ripple/component', to: 'https://ga.jspm.io/npm:@material/line-ripple@13.0.0/component.js'
pin '@material/linear-progress/component', to: 'https://ga.jspm.io/npm:@material/linear-progress@13.0.0/component.js'
pin '@material/notched-outline/component', to: 'https://ga.jspm.io/npm:@material/notched-outline@13.0.0/component.js'
pin '@material/ripple/component', to: 'https://ga.jspm.io/npm:@material/ripple@13.0.0/component.js'
pin '@material/ripple/foundation', to: 'https://ga.jspm.io/npm:@material/ripple@13.0.0/foundation.js'
pin 'tslib', to: 'https://ga.jspm.io/npm:tslib@2.3.1/tslib.es6.js'

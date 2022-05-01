# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin '@material/banner', to: 'https://ga.jspm.io/npm:@material/banner@14.0.0/index.js'
pin '@material/checkbox', to: 'https://ga.jspm.io/npm:@material/checkbox@14.0.0/index.js'
pin '@material/data-table', to: 'https://ga.jspm.io/npm:@material/data-table@14.0.0/index.js'
pin '@material/dialog', to: 'https://ga.jspm.io/npm:@material/dialog@14.0.0/index.js'
pin '@material/form-field', to: 'https://ga.jspm.io/npm:@material/form-field@14.0.0/index.js'
pin '@material/radio', to: 'https://ga.jspm.io/npm:@material/radio@14.0.0/index.js'
pin '@material/ripple', to: 'https://ga.jspm.io/npm:@material/ripple@14.0.0/index.js'
pin '@material/select', to: 'https://ga.jspm.io/npm:@material/select@14.0.0/index.js'
pin '@material/textfield', to: 'https://ga.jspm.io/npm:@material/textfield@14.0.0/index.js'
pin '@material/textfield/helper-text', to: 'https://ga.jspm.io/npm:@material/textfield@14.0.0/helper-text/index.js'
pin '@material/animation/animationframe', to: 'https://ga.jspm.io/npm:@material/animation@14.0.0/animationframe.js'
pin '@material/animation/util', to: 'https://ga.jspm.io/npm:@material/animation@14.0.0/util.js'
pin '@material/base/component', to: 'https://ga.jspm.io/npm:@material/base@14.0.0/component.js'
pin '@material/base/foundation', to: 'https://ga.jspm.io/npm:@material/base@14.0.0/foundation.js'
pin '@material/checkbox/component', to: 'https://ga.jspm.io/npm:@material/checkbox@14.0.0/component.js'
pin '@material/dom/events', to: 'https://ga.jspm.io/npm:@material/dom@14.0.0/events.js'
pin '@material/dom/focus-trap', to: 'https://ga.jspm.io/npm:@material/dom@14.0.0/focus-trap.js'
pin '@material/dom/keyboard', to: 'https://ga.jspm.io/npm:@material/dom@14.0.0/keyboard.js'
pin '@material/dom/ponyfill', to: 'https://ga.jspm.io/npm:@material/dom@14.0.0/ponyfill.js'
pin '@material/floating-label/component', to: 'https://ga.jspm.io/npm:@material/floating-label@14.0.0/component.js'
pin '@material/floating-label/foundation', to: 'https://ga.jspm.io/npm:@material/floating-label@14.0.0/foundation.js'
pin '@material/line-ripple/component', to: 'https://ga.jspm.io/npm:@material/line-ripple@14.0.0-canary.fae6c652d.0/component.js'
pin '@material/linear-progress/component', to: 'https://ga.jspm.io/npm:@material/linear-progress@14.0.0/component.js'
pin '@material/list/component', to: 'https://ga.jspm.io/npm:@material/list@14.0.0/component.js'
pin '@material/list/constants', to: 'https://ga.jspm.io/npm:@material/list@14.0.0/constants.js'
pin '@material/list/foundation', to: 'https://ga.jspm.io/npm:@material/list@14.0.0/foundation.js'
pin '@material/menu-surface/component', to: 'https://ga.jspm.io/npm:@material/menu-surface@14.0.0/component.js'
pin '@material/menu-surface/constants', to: 'https://ga.jspm.io/npm:@material/menu-surface@14.0.0/constants.js'
pin '@material/menu-surface/foundation', to: 'https://ga.jspm.io/npm:@material/menu-surface@14.0.0/foundation.js'
pin '@material/menu/component', to: 'https://ga.jspm.io/npm:@material/menu@14.0.0/component.js'
pin '@material/menu/constants', to: 'https://ga.jspm.io/npm:@material/menu@14.0.0/constants.js'
pin '@material/notched-outline/component', to: 'https://ga.jspm.io/npm:@material/notched-outline@14.0.0/component.js'
pin '@material/ripple/component', to: 'https://ga.jspm.io/npm:@material/ripple@14.0.0/component.js'
pin '@material/ripple/foundation', to: 'https://ga.jspm.io/npm:@material/ripple@14.0.0/foundation.js'
pin 'tslib', to: 'https://ga.jspm.io/npm:tslib@2.4.0/tslib.es6.js'

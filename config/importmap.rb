# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true

pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@material/web/button/filled-button', to: 'https://ga.jspm.io/npm:@material/web@1.0.0-pre.5/button/filled-button.js'
pin '@lit/reactive-element', to: 'https://ga.jspm.io/npm:@lit/reactive-element@1.6.1/reactive-element.js'
pin '@lit/reactive-element/decorators/', to: 'https://ga.jspm.io/npm:@lit/reactive-element@1.6.1/decorators/'
pin 'lit', to: 'https://ga.jspm.io/npm:lit@2.7.2/index.js'
pin 'lit-element/lit-element.js', to: 'https://ga.jspm.io/npm:lit-element@3.3.1/lit-element.js'
pin 'lit-html', to: 'https://ga.jspm.io/npm:lit-html@2.7.2/lit-html.js'
pin 'lit-html/', to: 'https://ga.jspm.io/npm:lit-html@2.7.2/'
pin 'lit/', to: 'https://ga.jspm.io/npm:lit@2.7.2/'
pin 'tslib', to: 'https://ga.jspm.io/npm:tslib@2.5.0/tslib.es6.js'

var _   = require('lodash');
var can = require('can');

var pages = require('../pages/*.js', { mode: 'hash' });

module.exports = can.Control.extend({
  init: function(element, options){
    this.element = element;
  },

  template: function(pageName){
    return [ "<fathomous-", pageName, "></fathomous-", pageName, ">" ].join("");
  },

  loadPage: function(pageName){
    this.element.empty();

    if (!pages[pageName]) pageName = "not-found";

    this.element.append(
      can.stache(this.template(pageName))
    );
  }
});

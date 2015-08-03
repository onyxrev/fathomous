var _   = require('lodash');
var can = require('can');

module.exports = function(options){
  can.route.bind("change", _.throttle(function(){
    var resource = can.route.attr("resource");

    if(resource) loadPage(resource);
  }, 150));

  can.route.ready()

  function loadPage(pageName){
    options.mainControl.loadPage(pageName);
  }
}

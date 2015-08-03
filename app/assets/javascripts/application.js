var $ = require('jquery');
var template = require('./templates/foo.stache');

$(document).ready(function(){
  $("body").append(template({greeting: 'Hello'}));
});

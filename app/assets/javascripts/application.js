var $ = require('jquery');

var router      = require('./router');
var MainControl = require('./controls/main');

$(document).ready(function(){
  router({
    mainControl: new MainControl("body")
  });
});

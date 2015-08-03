var can = require('can');

can.Component.extend({
  tag: "fathomous-post",
  template: require('./post/template.stache'),
  viewModel: {
    visible: false,
    message: "Hello There!"
  },
  events: {
    click: function(){
      this.viewModel.attr("visible", !this.viewModel.attr("visible") );
    }
  }
});

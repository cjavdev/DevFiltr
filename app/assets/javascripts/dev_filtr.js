window.DevFiltr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new DevFiltr.Routers.Assessments({
    	'$rootEl' : $("body")
    });
		Backbone.history.start();
  }
};

$(document).ready(function(){
  DevFiltr.initialize();
});

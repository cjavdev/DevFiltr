window.DevFiltr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new DevFiltr.Routers.Assessments({
    	'$rootEl' : $("#content")
    });
		Backbone.history.start();
  }
};
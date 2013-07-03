window.DevFiltr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new DevFiltr.Routers.Assessments({
    	'$rootEl' : $("#content")
    });
		
    new DevFiltr.Routers.AssessmentAttempts({
    	'$rootEl' : $("#content")
    });
		
		Backbone.history.start();
  }
};
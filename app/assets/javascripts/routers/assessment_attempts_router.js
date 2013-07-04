DevFiltr.Routers.AssessmentAttempts = Backbone.Router.extend({
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
		
		DevFiltr.assessment_attempts = new DevFiltr.Collections.AssessmentAttempts();
		DevFiltr.assessment_attempts.fetch();
	},
	
	routes: {
		"assessment_attempts/:id" : "show",
		"assessment_attempts"     : "index",		
		"assessments/:id/take"    : "new",
	},
	
	new: function (id) {
		var that = this;
		this._getAssessment(id, function(assessment) {
			var assessment_attempt = new DevFiltr.Models.AssessmentAttempt();
			assessment_attempt.set({"solution" : assessment.get("skeleton")});
			assessment.get("assessment_attempts").add(assessment_attempt);
			
			var formView = new DevFiltr.Views.AssessmentAttemptForm({
				model: assessment_attempt
			});
			
			that._swapView(formView);
		});
	},
	
	show: function (id) {
		var that = this;
		this._getAssessmentAttempt(id, function (assessment_attempt) {
			var showView = new DevFiltr.Views.AssessmentAttemptShow({
				model: assessment_attempt
			});
			
			that._swapView(showView);
		});
	},
	
	index: function () {
		
	}
});
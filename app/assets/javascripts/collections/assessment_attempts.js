DevFiltr.Collections.AssessmentAttempts = Backbone.Collection.extend({
	initialize: function (options) {
		this.assessment = options.assessment;
	},

  model: DevFiltr.Models.AssessmentAttempt,
	
	url: function () {
		return this.assessment.url() + "/assessment_attempts";
	},
});

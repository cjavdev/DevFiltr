DevFiltr.Collections.AssessmentAttempts = Backbone.Collection.extend({

  model: DevFiltr.Models.AssessmentAttempt,
	url: function () {
		return this.assessment.url() + "/assessment_attempts";
	},

});

DevFiltr.Collections.AssessmentAttempts = Backbone.Collection.extend({
	initialize: function (options) {
		if(options && options.assessment) {
			this.assessment = options.assessment;	
		} 
	},

  model: DevFiltr.Models.AssessmentAttempt,
	
	url: function () {
		if(this.assessment) {
			return this.assessment.url() + "/assessment_attempts";	
		} else {
			return "/assessment_attempts";
		}
	},
});

DevFiltr.Models.Assessment = Backbone.Model.extend({
	parse: function (data) {
		if(!this.assessment_attempts) {
			this.assessment_attempts = new DevFiltr.Collections.AssessmentAttempts({
				assessment: this
			});
		}
		this.assessment_attempts.set(data.assessment_attempts);
		delete data.assessment_attempts;
		
		return data;
	},
	
	toJSON: function() {
		var json = Backbone.Model.prototype.toJSON.call(this);
	}
});

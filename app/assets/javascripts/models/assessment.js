DevFiltr.Models.Assessment = Backbone.Model.extend({
	parse: function (data) {
		var attempts = new DevFiltr.Collections.AssessmentAttempts({
				assessment: this
		});
		
		attempts.set(data.assessment_attempts);
		
		if(!this.assessment_attempts) {
			this.assessment_attempts = new DevFiltr.Collections.AssessmentAttempts({
				assessment: this
			});
		}
		
		
		delete data.assessment_attempts;
		data.assessment_attempts = this.assessment_attempts;
		return data;
	},
	
	toJSON: function() {
		var json = Backbone.Model.prototype.toJSON.call(this);
		json.assessment.assessment_attempts_attributes = this.assessment_attempts.toJSON();
		return json;
	}
});

DevFiltr.Models.AssessmentAttempt = Backbone.Model.extend({
	jsonRoot: "assessment_attempt",
	
	parse: function (data) {
		var report = new DevFiltr.Collections.Reports({
				assessment_attempt: this
		});
		
		report.set(data.report);
		data.report = report;
		return data;
	},
	
	// toJSON: function() {
// 		var json = Backbone.Model.prototype.toJSON.call(this);
// 		
// 		if(this.report) {
// 			json.assessment_attempt.report_attributes = this.report.toJSON();
// 		}
// 		
// 		return json;
// 	}
});

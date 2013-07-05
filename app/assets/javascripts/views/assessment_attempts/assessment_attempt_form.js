DevFiltr.Views.AssessmentAttemptForm = Backbone.View.extend({
	events: {
		"submit form" : "submit"
	},
	
	template: JST['assessment_attempts/form'],
	
	render: function () {
		var renderedContent = this.template({
			assessment_attempt: this.model
		});
		
		this.$el.html(renderedContent);
		
		return this;
	},
	
	submit: function (event) {
		event.preventDefault();
		var that = this;
		
		var attrs = $(event.target).serializeJSON();
		attrs.assessment_attempt.solution = editor.getValue();
		attrs.assessment_attempt.assessment_id = this.model.collection.assessment.id;
		this.model.save(attrs, {
			success: function (model) {
				console.log("submit succeeded");
				Backbone.history.navigate("assessment_attempts/" + model.id, true);
			},
			error: function(model, resp) {
				console.log("error: " + resp.responseText);
				that.$el.prepend(resp.responseText);
			}
		});
	},	
});
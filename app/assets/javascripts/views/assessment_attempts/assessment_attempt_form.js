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
		this.model.set(attrs);
		
		this.model.save({
			success: function () {
				console.log(that.model);
			},
		});
		//var assessment_attempt = new DevFiltr.Models.AssessmentAttempt(attrs)
	},
	
});
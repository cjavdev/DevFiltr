DevFiltr.Views.AssessmentAttemptForm = Backbone.View.extend({
	
	template: JST['assessment_attempts/form'],
	
	render: function () {
		
		var renderedContent = this.template({
			assessment_attempt: this.model
		});
		
		this.$el.html(renderedContent);
		
		return this;
	},
	
});
DevFiltr.Views.AssessmentAttemptNew = Backbone.View.extend({
	initialize: function (options) {
		this.listenTo(this.model, "all", this.render);
	},
	
	template: JST['assessment_attempts/new'],
	
	render: function () {
		var formView = new DevFiltr.Views.AssessmentAttemptForm({
			model: this.model
		});

		var showView = new DevFiltr.Views.AssessmentAttemptShow({
			model: this.model
		});
		
		fvContent = formView.render().$el;
		svContent = showView.render().$el;
		var renderedContent = this.template({
			form: fvContent,
			show: svContent
		});
		
		this.$el.html(renderedContent);
		return this;
	},	
});
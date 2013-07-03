DevFiltr.Views.AssessmentAttemptShow = Backbone.View.extend({
	initialize: function (options) {
		this.listenTo(this.model, "all", this.render);
	},

  template: JST['assessment_attempts/show'],
	
	render: function () {
		var renderedContent = this.template({
			assessment_attempt: this.model
		});
		
		this.$el.html(renderedContent);
		return this;
	},

});

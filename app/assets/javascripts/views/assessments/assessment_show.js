DevFiltr.Views.AssessmentShow = Backbone.View.extend({
	inintialize: function (options) {
		this.listenTo(this.model, "change", this.render);
	},
	
	template: JST['assessments/show'],
	
	render: function () {
		console.log("rendering");
		var renderedContent = this.template({
			assessment: this.model
		});
		
		this.$el.html(renderedContent);
		return this;
	}
});
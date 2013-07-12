DevFiltr.Views.AssessmentShow = Backbone.View.extend({
	inintialize: function (options) {
		this.listenTo(this.model.collection, "change add sync all", this.render);
	},
	
	template: JST['assessments/show'],
	
	render: function () {
		var renderedContent = this.template({
			assessment: this.model
		});
		
		this.$el.html(renderedContent);
		return this;
	}
});
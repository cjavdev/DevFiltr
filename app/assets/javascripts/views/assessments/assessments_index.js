DevFiltr.Views.AssessmentsIndex = Backbone.View.extend({
	initialize: function () {
		this.listenTo(this.collection, "sync", this.render);
		this.listenTo(this.collection, "demo_fetch", this.render);
	},
	
  template: JST['assessments/index'],
	
	render: function () {		
		var renderedContent = this.template({
			assessments: this.collection
		});
		
		this.$el.html(renderedContent);
		return this;
	},
});

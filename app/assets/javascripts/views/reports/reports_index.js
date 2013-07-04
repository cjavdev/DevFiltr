DevFiltr.Views.ReportsIndex = Backbone.View.extend({

  template: JST['report/index'], 
	
	render: function () {
		var renderedContent = this.template();
		
		this.$el.html(renderedContent);
		return this;
	},

});

DevFiltr.Views.ReportsIndex = Backbone.View.extend({

  template: JST['reports/index'], 
	
	render: function () {
		var renderedContent = this.template({
			report: this.model
		});
		
		this.$el.html(renderedContent);
		return this;
	},

});

DevFiltr.Views.AssessmentInvitesIndex = Backbone.View.extend({
	initialize: function () {
		this.listenTo(this.collection, "all", this.render);
	},
	
  template: JST['assessment_invites/index'],
	
	render: function () {
		var renderedContent = this.template({
			invites: this.collection
		});
		
		this.$el.html(renderedContent);
		return this;
	},

});

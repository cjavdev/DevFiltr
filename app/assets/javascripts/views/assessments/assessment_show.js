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
		
		var inviteView = new DevFiltr.Views.AssessmentInviteForm({
			assessment_id: this.model.id
		});
		
		this.$el.find("#modal-invite").append(inviteView.render().$el);
		return this;
	}
});
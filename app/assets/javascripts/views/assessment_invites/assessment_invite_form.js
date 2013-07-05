DevFiltr.Views.AssessmentInviteForm = Backbone.View.extend({
	initialize: function (options) {
		this.assessment_id = options.assessment_id;
		
		if(!DevFiltr.invites) {
			DevFiltr.invites = new DevFiltr.Collections.AssessmentInvites();
			DevFiltr.invites.fetch();
		}
	},
	
	events:{
		"click button#send" : "new"
	},

  template: JST['assessment_invites/form'],
	
	render: function () {
		var renderedContent = this.template();
		
		this.$el.html(renderedContent);
		return this;
	},
	
	new: function (event) {
		event.preventDefault();
		var that = this;
		var invite = { assessment_invite: {
			email: this.$el.find("#email").val(),
			assessment_id: this.assessment_id
		}}
		
		DevFiltr.invites.create(invite, { 
			parse: true,
			success: function (model, resp) {
				$("#myModal").modal('hide');
				var sentNotice = JST["notice"]({ message: "Sent!" });
				$("#content").prepend(sentNotice);
			},
			error: function (model, resp) {
				this.$el.prepend(resp.responseText);
			},
		});
		
	},

});

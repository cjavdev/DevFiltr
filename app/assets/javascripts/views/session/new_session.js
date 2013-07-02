DevFiltr.Views.LoginView = Backbone.View.extend({
	events: {
		"submit form" : "submit"
	},
	
	template: JST['session/new'],
	
	render: function () {
		var renderedContent = this.template();
		
		this.$el.html(renderedContent);
		return this;
	},
	
	submit: function (event) {
		event.preventDefault();
		var that = this;
		
		$.ajax({
			url: "/session",
			type: "post",
			data: $(event.target).serializeJSON(),
			success: function (session, resp, xhr) {
				DevFiltr.assessments.fetch({
					success: function() {
						Backbone.history.navigate("assessments", true);
					}
				});
			},
			error: function (session, resp, xhr) {
				that.$el.prepend(resp.responseText);
			},
		})
	},
});
DevFiltr.Views.AssessmentForm = Backbone.View.extend({
	initialize: function () {
		// this.listenTo(this.collection, "sync", this.render);
	},
	
	events: {
		"submit form" : "submit"
	},
	
  template: JST['assessments/form'],
	
	render: function () {
		
		var renderedContent = this.template({
			assessment: this.model
		});
		
		this.$el.html(renderedContent);
		return this;
	},

	submit: function (event) {
		var that = this;
		event.preventDefault();
		
		var attrs = $(event.target).serializeJSON();
		attrs.assessment.skeleton = skeleton_editor.getValue();
		attrs.assessment.specs = spec_editor.getValue();
		console.log(attrs);
		DevFiltr.assessments.create(attrs, { 
		error: function (assessment, resp, xhr) {
			that.$el.prepend(resp.responseText);
		},
		success: function (assessment, resp, xhr) {
			Backbone.history.navigate("assessments/" + assessment.id, true);
		}});
	},
});

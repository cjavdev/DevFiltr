DevFiltr.Routers.Assessments = Backbone.Router.extend({
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
		
		DevFiltr.assessments = new DevFiltr.Collections.Assessments();
		DevFiltr.assessments.fetch();
	},
	
	routes: {
		"": "index",
		"session/new" : "login",
		"assessments/new" : "new",
		"assessments/:id" : "show",
		"assessments" : "index",
	},
	
	index: function () {
		var indexView = new DevFiltr.Views.AssessmentsIndex({
			collection: DevFiltr.assessments
		});
		
		this._swapView(indexView);
	},
	
	show: function (id) {
		var that = this;
		this._getAssessment(id, function(assessment) {
			var showView = new DevFiltr.Views.AssessmentShow({
				model: assessment
			});
		
			that._swapView(showView);
		});
	},
	
	new: function (id) {
		var assessment = new DevFiltr.Models.Assessment();
		
		var formView = new DevFiltr.Views.AssessmentForm({
			model: assessment
		});
		
		this._swapView(formView);
	},
	
	login: function () {
		var loginView = new DevFiltr.Views.LoginView();
		
		this._swapView(loginView);
	}
});

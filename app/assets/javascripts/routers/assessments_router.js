DevFiltr.Routers.Assessments = Backbone.Router.extend({
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
		
		DevFiltr.assessments = new DevFiltr.Collections.Assessments();
		DevFiltr.assessments.fetch();
	},
	
	routes: {
		"": "index",
		"session/new" : "login",
		"assessments/:id/take" : "take",
		"assessments/new" : "new_assessment",
		"assessments/:id" : "show",
		"assessments" : "index"
	},
	
	index: function () {
		var indexView = new DevFiltr.Views.AssessmentsIndex({
			collection: DevFiltr.assessments
		});
		
		this._swapView(indexView);
	},
	
	show: function (id) {
		var that = this;
		console.log("showing");
		this._getAssessment(id, function(assessment) {
			var showView = new DevFiltr.Views.AssessmentShow({
				model: assessment
			});
		
			that._swapView(showView);
		});
	},
	
	take: function (id) {
		var assessment_attempt = new DevFiltr.Models.AssessmentAttempt();
		
		var formView = new DevFiltr.Views.AssessmentAttemptForm({
			model: assessment_attempt
		});
		
		this._swapView(formView);
	},
	
	new_assessment: function (id) {
		var assessment = new DevFiltr.Models.Assessment();
		
		var formView = new DevFiltr.Views.AssessmentForm({
			model: assessment
		});
		
		this._swapView(formView);
	},
	
	login: function () {
		console.log("logging in");
		var loginView = new DevFiltr.Views.LoginView();
		
		this._swapView(loginView);
	},
	
	_swapView: function (view) {
		console.log("swapping views");
		if(this._currentView) {
			this._currentView.remove();
		}
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	},
	
	_getAssessment: function(id, callback) {
		var assessment = DevFiltr.assessments.get(id);
		
		if(!assessment) {
			assessment = new DevFiltr.Models.Assessment({ id: id });
			DevFiltr.assessments.add(assessment);
			assessment.fetch({success: function (model) {
				callback(model);
			}});
		} else {
			callback(assessment);
		}
		
		return assessment;
	}
});

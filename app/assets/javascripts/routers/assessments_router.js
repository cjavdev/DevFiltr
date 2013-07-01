DevFiltr.Routers.Assessments = Backbone.Router.extend({
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
		
		DevFiltr.assessments = new DevFiltr.Collections.Assessments();
		DevFiltr.assessments.fetch();
	},
	
	routes: {
		"": "index",
		"assessments/:id" : "show"
	},
	
	index: function () {
		var indexView = new DevFiltr.Views.AssessmentsIndex({
			collection: DevFiltr.assessments
		});
		
		this.$rootEl.html(indexView.render().$el);
	},
	
	show: function (id) {
		var assessment = this._getAssessment(id);
		
		var showIndex = new DevFiltr.Views.AssessmentShow({
			model: assessment
		});
		
		this.$rootEl.html(showIndex.render().$el);
	},
	
	_getAssessment: function(id) {
		var assessment = DevFiltr.assessments.get(id);
		if(!assessment) {
			assessment = new DevFiltr.Models.Assessment({ id: id });
			DevFiltr.assessments.add(assessment);
			assessment.fetch({success: function () {
				console.log("got all new assessment");
			}});
		}
		return assessment;
	}
});

DevFiltr.Routers.Reports = Backbone.Router.extend({
	routes: {
		"assessment_attempts/:id/report" : "show"
	}, 
	
	show: function (id) {
		console.log("showing report");
	},
});

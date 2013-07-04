DevFiltr.Collections.Assessments = Backbone.Collection.extend({

  model: DevFiltr.Models.Assessment,
	url: "/assessments"

});

DevFiltr.Collections.Assessments.fetchDemo = function (callback) {
	$.ajax({
		url: "/assessments/demo",
		type: "GET",
		success: function (model, resp) {
			DevFiltr.assessments = new DevFiltr.Collections.Assessments(model, { 
				parse: true 
			});
			
			callback(DevFiltr.assessments);
		},
		error: function (model, resp) {
			console.log(resp.responseText);
		},
	});
};
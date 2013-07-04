Backbone.Router.prototype._getAssessment = function(id, callback) {
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
};

Backbone.Router.prototype._getClientAssessment = function(id, callback) {
	var assessment = DevFiltr.assessments.get(id);
	if(!assessment) {
		Backbone.history.navigate("", true);
	} else {
		callback(assessment);
	}
	return assessment;
};

Backbone.Router.prototype._getAssessmentAttempt = function (id, callback) {
	var attempt = DevFiltr.assessment_attempts.get(id);
	if(!attempt) {
		attempt = new DevFiltr.Models.AssessmentAttempt({id: id});
		DevFiltr.assessment_attempts.add(attempt);
		attempt.fetch({ 
			success: function (model) {
				callback(model);
			},
		});
	} else {
		callback(attempt);
	}
	return attempt;
};

Backbone.Router.prototype._swapView =  function (view) {
	console.log("swapping views");
	if(this._currentView) {
		this._currentView.remove();
	}
	this._currentView = view;
	this.$rootEl.html(view.render().$el);
};
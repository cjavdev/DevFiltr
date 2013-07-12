DevFiltr.Models.Assessment = Backbone.RelationalModel.extend({
	relations: [{
		type						: Backbone.HasMany,
		key							: 'assessment_attempts',
		relatedModel		: 'DevFiltr.Models.AssessmentAttempt',
		collectionType	: 'DevFiltr.Collections.AssessmentAttempts',
		reverseRelation	: {
			key	: 'assessment'
		}
	}, {
		type						: Backbone.HasMany,
		key							: 'assessment_invites',
		relatedModel		: 'DevFiltr.Models.AssessmentInvite',
		collectionType	: 'DevFiltr.Collections.AssessmentInvites',
		reverseRelation	: {
			key : 'assessment'
		}
	}]
});

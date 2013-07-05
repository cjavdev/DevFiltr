object @assessment
attributes :id, :title, :difficulty, :specs, :skeleton, :language, :time_limit, :assessment_attempts
child :assessment_attempts do |attempt|
  attributes :id, :candidate_id, :finished_at, :solution, :started_at, :title, :assessment_id, :report
	node(:candidate_name) { |x| x.candidate.email }
end
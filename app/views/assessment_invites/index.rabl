collection @invites
attributes :id, :email, :assessment_id, :assessment
child(:assessment) { attributes :title }
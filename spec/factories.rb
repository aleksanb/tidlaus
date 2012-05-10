Factory.define :user do |user|
	user.name "foobarbazui"
end

Factory.define :exercise do |exercise|
	exercise.levert false
	exercise.ferdig false
	exercise.name "Digtek"
	exercise.date Time.now
	exercise.meta 1
	exercise.antall 1

	exercise.association :user
end
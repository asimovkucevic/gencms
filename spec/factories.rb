Factory.define :user do |u|
	u.email "joe@gmail.com"
	u.password "password"
end

Factory.define :message do |m|
	m.association :sender, :factory => :blue
	m.association :recipient, :factory => :blue
	m.subject "This is a message"
end
Factory.define :gem_item do |gem_item|
  gem_item.sequence(:name) { |n| "gem_name_#{n}"}
  gem_item.version "1.0.1"
end

Factory.define :user do |user|
  user.sequence(:name) { |n| "User #{n}" }
  user.sequence(:nickname) { |n| "user_#{n}" }
  user.sequence(:email) { |n| "test#{n}@foo.com" }
end

Factory.define :subscribe do |subscribe|
  subscribe.user { |u| u.association(:user) }
  subscribe.gem_item { |u| u.association(:gem_item) }
end

Factory.define :notification do |notification|
  notification.gem_item { |gem_item| gem_item.association(:gem_item) }
  notification.sequence(:version ) { |n| "1.0.#{n}" }
  notification.upgraded_at Time.now
end

Factory.define :authorization do |authorization|
  authorization.provider 'github'
  authorization.association(:user)
  authorization.uid '1234'
end
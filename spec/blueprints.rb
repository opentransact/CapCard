require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.login { Faker::Internet.user_name }
Sham.name  { Faker::Name.name }
Sham.first_name  { Faker::Name.first_name }
Sham.last_name  { Faker::Name.last_name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }
Sham.url { "http://#{Faker::Internet.domain_name}"}

Card.blueprint do
  email { Sham.email }
  name { Sham.name }
end

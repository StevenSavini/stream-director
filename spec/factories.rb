FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "#{Faker::Internet.email}#{n}"
    end
    password Faker::Internet.password
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence :username do |n|
      "#{Faker::Internet.user_name}#{n}"
    end
  end

  factory :movie do
    sequence :title do |n|
      "Guardians of the Galaxy#{n}"
    end
    description "This is a long description that is supposed to talk about how
                 great this movie is and it's here mostly to take up space and
                 make our page look good."
  end
end

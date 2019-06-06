FactoryBot.define do
  factory :testimonial do
    language { nil }
    visible { false }
    priority { 1 }
    date { "2019-06-06" }
    name { "MyString" }
    image { "MyString" }
    url { "MyString" }
    text { "MyText" }
  end
end

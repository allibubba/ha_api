FactoryBot.define do
  factory :switch do
    name { 'kitchen main lights' }
    brand { 'Lutron Caseta' }
    protocol { 'proprietary' }
    location { 'kitchen' }
  end
end

require_relative 'support/randomizer.rb'
FactoryGirl.define do
  factory :sponsor do
    fullname rand_text
  end
end

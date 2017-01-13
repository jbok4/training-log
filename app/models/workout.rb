class Workout < ApplicationRecord
  has_many :exercises, dependent: :destroy
  accepts_nested_attributes_for :exercises, reject_if: lambda { |a| a[:name].blank? }, :allow_destroy => true
end

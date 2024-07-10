class Component < ApplicationRecord
  has_many :app_components
  has_many :apps, through: :app_components
end

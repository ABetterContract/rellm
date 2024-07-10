class App < ApplicationRecord
  has_many :app_components
  has_many :components, through: :app_components
end

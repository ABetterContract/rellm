# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  {
    name: "Card",
    description: "Displays a card with header, content, and footer.",
    template: "components/card.tsx.erb",
    shad_name: "card"
  }
].each do |c|
  Component.find_or_create_by!(name: c[:name]) do |comp|
    comp.description = c[:description]
    comp.template = c[:template]
    comp.shad_name = c[:shad_name]
  end
end
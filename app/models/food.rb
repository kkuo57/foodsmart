class Food < ApplicationRecord
  require 'csv'
  searchkick word_start: [:name]

  def self.import(file)
    CSV.foreach('db/en.openfoodfacts.org.products.csv', headers: true, col_sep: "\t") do |row|
      food_hash = row.to_hash
      Food.create({
        id: food_hash["id"],
        name: food_hash["product_name"],
        ingredients: food_hash["ingredients_text"],
        score: food_hash["nutrition_grade_uk"] || food_hash["nutrition_grade_fr"] || 700
      })
    end
  end
end

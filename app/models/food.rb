class Food < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach('db/en.openfoodfacts.org.products.csv', headers: true, col_sep: "\t") do |row|

      food_hash = row.to_hash
      food = Food.where(id: food_hash["id"])
      f = {}
      f["name"] = food_hash["product_name"]
      f["ingredients"] = food_hash["ingredients_text"]
      if food_hash["nutrition_grade_uk"] == nil && food_hash["nutrition_grade_fr"] == nil
        f["score"] = 700
      elsif food_hash["nutrition_grade_fr"] == nil
        f["score"] = food_hash["nutrition_grade_uk"]
      else food_hash["nutrition_grade_uk"] == nil
        f["score"] = food_hash["nutrition_grade_fr"]
      end

      if food.count == 1
        food.first.update_attributes(food_hash)
      else
        Food.create!(food_hash)
      end
    end
  end
end

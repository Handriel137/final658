class AddCharacterToItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :character, foreign_key: true
  end
end

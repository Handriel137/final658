class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :job
      t.integer :level
      t.string :player

      t.timestamps
    end
  end
end

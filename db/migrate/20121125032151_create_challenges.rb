class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :stop
      t.boolean :limit
      t.string :validation
      t.integer :points
      t.string :prize
      t.string :badge
      t.boolean :complete
      t.references :competition

      t.timestamps
    end
    add_index :challenges, :competition_id
  end
end

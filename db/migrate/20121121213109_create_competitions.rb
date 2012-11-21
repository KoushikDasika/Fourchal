class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.references :user
      t.datetime :startTime
      t.datetime :endTime

      t.timestamps
    end
    add_index :competitions, :user_id
  end
end

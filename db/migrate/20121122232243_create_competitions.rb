class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.datetime :startTime
      t.datetime :endTime
      t.references :user

      t.timestamps
    end
    add_index :competitions, :user_id
  end
end

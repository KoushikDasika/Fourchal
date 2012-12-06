class CreateCompetitionEntries < ActiveRecord::Migration
  def change
    create_table :competition_entries do |t|
      t.references :competition
      t.references :user

      t.timestamps
    end
    add_index :competition_entries, :competition_id
    add_index :competition_entries, :user_id
  end
end

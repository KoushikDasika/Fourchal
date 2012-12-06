class CreateChallengeEntries < ActiveRecord::Migration
  def change
    create_table :challenge_entries do |t|
      t.references :competition_entry
      t.references :challenge
      t.boolean :complete

      t.timestamps
    end
    add_index :challenge_entries, :competition_entry_id
    add_index :challenge_entries, :challenge_id
  end
end

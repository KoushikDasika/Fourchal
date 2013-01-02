class AddPointsFieldToChallengeEntries < ActiveRecord::Migration
  def change
    add_column :challenge_entries, :points, :integer
  end
end

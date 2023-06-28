class RemoveClanIdFromClans < ActiveRecord::Migration[7.0]
  def change
    remove_column :clans, :clan_id, :integer
  end
end

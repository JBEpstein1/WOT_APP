class AddClanIdToClans < ActiveRecord::Migration[7.0]
  def change
    add_column :clans, :clan_id, :integer
  end
end

class AddRankToClans < ActiveRecord::Migration[7.0]
  def change
    add_column :clans, :rank, :integer
  end
end

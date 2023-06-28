class CreateClans < ActiveRecord::Migration[7.0]
  def change
    create_table :clans do |t|
      t.integer :clan_id
      t.string :name

      t.timestamps
    end
  end
end

class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.references :clan, null: false, foreign_key: true
      t.references :previous_clan, foreign_key: { to_table: :clans }
      t.datetime :left_clan_at

      t.timestamps
    end
  end
end

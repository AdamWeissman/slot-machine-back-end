class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
      t.integer :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :test_id
      t.integer :score

      t.timestamps null: false
    end
  end
end

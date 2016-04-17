class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :answer
      t.integer :points

      t.timestamps null: false
    end
  end
end

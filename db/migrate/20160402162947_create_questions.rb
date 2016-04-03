class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :category
      t.string :question_text
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5
      t.string :answer
      t.string :points

      t.timestamps null: false
    end
  end
end

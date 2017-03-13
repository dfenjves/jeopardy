class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.integer :clue_id
      t.string :category
      t.timestamps
    end
  end
end

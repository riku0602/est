class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :menu, foreign_key: true
      t.string :ip 
      t.timestamps
    end
  end
end

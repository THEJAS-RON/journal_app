class CreateJournals < ActiveRecord::Migration[7.2]
  def change
    create_table :journals do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :public_link

      t.timestamps
    end
  end
end

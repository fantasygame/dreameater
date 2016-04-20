class CreateDreamComments < ActiveRecord::Migration
  def change
    create_table :dream_comments do |t|
      t.text :content
      t.belongs_to :dream, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end


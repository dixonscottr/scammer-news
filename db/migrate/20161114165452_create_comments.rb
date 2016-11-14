class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|

      t.string :title, null: false
      t.text :content, null: false
      t.references :commenter
      t.references :article

      t.timestamps
    end
  end
end

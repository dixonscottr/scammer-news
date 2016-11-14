class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|

      t.string :title, null: false
      t.string :link, null: false
      t.references :author

      t.timestamps
    end
  end
end

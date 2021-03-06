class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :text,                 null: false
      t.integer :price,             null: false
      t.integer :category,          null: false
      t.integer :status,            null: false
      t.integer :prefecture,        null: false
      t.integer :burden,            null: false
      t.integer :days,              null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end

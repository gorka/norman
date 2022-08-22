class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.integer :rating
      t.text :comment
      t.references :viewable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

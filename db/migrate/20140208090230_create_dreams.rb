class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :title
      t.string :description
      t.string :child_fullname
      t.integer :child_age
      t.string :region
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end

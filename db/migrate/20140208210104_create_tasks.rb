class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :dream, index: true
      t.references :sponsor, index: true
      t.references :user, index: true
      t.boolean :result
      t.string :description

      t.timestamps
    end
  end
end

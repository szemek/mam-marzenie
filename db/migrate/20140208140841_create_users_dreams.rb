class CreateUsersDreams < ActiveRecord::Migration
  def change
    create_table :users_dreams do |t|
      t.belongs_to :user
      t.belongs_to :dream
    end
  end
end

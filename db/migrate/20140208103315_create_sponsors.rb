class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :fullname
      t.string :description
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end

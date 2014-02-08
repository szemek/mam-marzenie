class AddAvatarToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :avatar, :string
  end
end

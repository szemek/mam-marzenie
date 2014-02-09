class AddWebsiteToDream < ActiveRecord::Migration
  def change
    add_column :dreams, :website, :string
  end
end

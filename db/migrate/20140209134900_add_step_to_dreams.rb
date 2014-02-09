class AddStepToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :step, :integer
  end
end

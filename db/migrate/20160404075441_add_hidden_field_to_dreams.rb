class AddHiddenFieldToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :hidden, :boolean
  end
end

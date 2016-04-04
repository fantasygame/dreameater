class AddHiddenFieldToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :hidden, :boolean, default: false
  end
end

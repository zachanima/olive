class RenameUriToLocationInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :uri, :location
  end
end

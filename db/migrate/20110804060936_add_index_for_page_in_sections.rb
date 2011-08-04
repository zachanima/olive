class AddIndexForPageInSections < ActiveRecord::Migration
  def change
    add_index :sections, :page_id
  end
end

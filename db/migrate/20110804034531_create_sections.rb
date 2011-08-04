class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :text
      t.references :page

      t.timestamps
    end
  end
end

class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :uri
      t.integer :position

      t.timestamps
    end
  end
end

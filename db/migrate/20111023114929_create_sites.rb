class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :subtitle
      t.string :domain
      t.date :departs_on
      t.string :depart_text

      t.timestamps
    end
  end
end

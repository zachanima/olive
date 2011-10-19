class AddImageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :image_file_name, :string
    add_column :pages, :image_content_type, :string
    add_column :pages, :image_file_size, :integer
    add_column :pages, :image_updated_at, :datetime
  end
end

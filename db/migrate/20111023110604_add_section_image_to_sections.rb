class AddSectionImageToSections < ActiveRecord::Migration
  def change
    add_column :sections, :section_image_file_name, :string
    add_column :sections, :section_image_content_type, :string
    add_column :sections, :section_image_file_size, :integer
    add_column :sections, :section_image_updated_at, :datetime
  end
end

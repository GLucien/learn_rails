class AddAvatarToFileManages < ActiveRecord::Migration[5.1]
  def change
    add_column :file_manages, :avatar, :string
  end
end

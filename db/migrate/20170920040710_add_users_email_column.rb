class AddUsersEmailColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users,:email_address,:string
  end
end

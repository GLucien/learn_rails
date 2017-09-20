class AddUsersCryptedPasswordColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :crypted_password, :string,null: false
    # 随机数，用于加密密码
    add_column :users, :salt, :string,null: false

    remove_column :users,:password
  end
end

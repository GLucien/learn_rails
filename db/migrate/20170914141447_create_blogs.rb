class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text  :content
      t.boolean :is_public, default: true
      # 以下是两种定义外键的方式
      #１． t.integer :user_id
      #２． t.belongs_to :user
      # 第二种方式会默认创建索引
      t.belongs_to :user
      t.timestamps
    end

    # add_index :blogs,:user_id
  end
end

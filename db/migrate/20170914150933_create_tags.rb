class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end
    # 关联关系表需要手动创建的,只是用来存储关联关系.不需要创建model
    create_table :blogs_tags do |t|
      t.integer :blog_id
      t.integer :tag_id
    end
  end
end

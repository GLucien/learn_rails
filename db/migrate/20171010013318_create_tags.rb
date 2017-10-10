class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :tagable, :polymorphic => true #这里指明了多态，这样会生成tagable_id和tagable_type这两个字段
      t.timestamps
    end
  end
end

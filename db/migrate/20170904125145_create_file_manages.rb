class CreateFileManages < ActiveRecord::Migration[5.1]
  def change
    create_table :file_manages do |t|
      t.timestamps
    end
  end
end

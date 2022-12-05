class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.integer :description_id
      t.integer :user_id
      t.boolean :is_confirm

      t.timestamps
    end
  end
end

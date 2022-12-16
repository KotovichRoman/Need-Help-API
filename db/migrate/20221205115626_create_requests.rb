class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.integer :description_id
      t.references :user, null: false, foreign_key: true
      t.boolean :is_confirm

      t.timestamps
    end
  end
end

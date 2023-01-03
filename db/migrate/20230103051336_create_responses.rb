class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.boolean :is_approve, default: false
      t.timestamps
    end
  end
end

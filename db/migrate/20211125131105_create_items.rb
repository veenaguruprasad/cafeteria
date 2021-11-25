class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.bigint :price
      t.bigint :category_id

      t.timestamps
    end
  end
end

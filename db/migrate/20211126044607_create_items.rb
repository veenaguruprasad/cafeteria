class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.bigint :price
      t.bigint :submenu_id

      t.timestamps
    end
  end
end

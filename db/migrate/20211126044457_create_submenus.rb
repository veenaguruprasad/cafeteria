class CreateSubmenus < ActiveRecord::Migration[6.1]
  def change
    create_table :submenus do |t|
      t.string :submenu_name

      t.timestamps
    end
  end
end

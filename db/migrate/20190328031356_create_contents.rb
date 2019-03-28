class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :value, null: false
      t.string :kind, null: false

      t.timestamps
    end
  end
end

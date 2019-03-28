class AddPageToContents < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :page, index: true, foreign_key: true
  end
end

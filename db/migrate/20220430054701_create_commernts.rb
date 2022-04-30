class CreateCommernts < ActiveRecord::Migration[6.1]
  def change
    create_table :commernts do |t|
      t.integer :member_id
      t.integer :post_id
      t.text :commernt_text

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 5, scale: 2, null: false

      t.timestamps
    end
  end
end

class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.string :name
      t.string :lang
      t.string :category
      t.string :code
      t.text :desc

      t.timestamps
    end
  end
end

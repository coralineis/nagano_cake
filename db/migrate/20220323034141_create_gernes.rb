class CreateGernes < ActiveRecord::Migration[6.1]
  def change
    create_table :gernes do |t|
      t.string :name

      t.timestamps
    end
  end
end

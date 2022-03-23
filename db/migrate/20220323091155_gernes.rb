class Gernes < ActiveRecord::Migration[6.1]
  def change
    drop_table :gernes do |t|
      t.string :name
    end
  end
end

class AddColumnCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_deleted, :boolean, null: false, default: false
    change_column_null :addresses, :customer_id, false
    change_column_null :addresses, :name, false
    change_column_null :addresses, :postal_code, false
    change_column_null :addresses, :address, false
    change_column_null :items, :name, false
    change_column_null :items, :introduction, false
    change_column_null :items, :price, false
    change_column_null :items, :is_active, false
    remove_column :items, :gerne_id, :integer
    change_column_null :items, :image_id, false
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :postal_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :telephone_number, false
    change_column_null :genres, :name, false
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :customer_id, false
    change_column_null :cart_items, :amount, false
    change_column_null :orders, :customer_id, false
    change_column_null :orders, :postal_code, false
    change_column_null :orders, :address, false
    change_column_null :orders, :name, false
    change_column_null :orders, :shipping_cost, false
    change_column_null :orders, :total_payment, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :status, false
    change_column_null :order_details, :item_id, false
    change_column_null :order_details, :order_id, false
    change_column_null :order_details, :price, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :making_status, false
  end
end

class ChangeOderStatusIdToOrderStatusId < ActiveRecord::Migration
  def change
    rename_column :orders, :oder_status_id, :order_status_id
  end
end

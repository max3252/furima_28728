class RenameBurdenColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :burden, :burden_id
  end
end

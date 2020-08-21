class RenameDaysColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :days, :date
  end
end

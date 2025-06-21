class AddPriorityToCatalogs < ActiveRecord::Migration[8.0]
  def change
    add_column :catalogs, :priority, :string
  end
end

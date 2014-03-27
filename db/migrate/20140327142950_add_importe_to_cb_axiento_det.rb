class AddImporteToCbAxientoDet < ActiveRecord::Migration
  def change
    add_column :cb_axiento_dets, :importe, :float
  end
end

class AddAxientoIdToCbAxientoDets < ActiveRecord::Migration
  def change
    add_column :cb_axiento_dets, :axiento_id, :integer
  end
end

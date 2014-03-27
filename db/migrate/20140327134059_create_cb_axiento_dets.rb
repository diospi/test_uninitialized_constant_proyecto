class CreateCbAxientoDets < ActiveRecord::Migration
  def change
    create_table :cb_axiento_dets do |t|
      t.string :name
      t.integer :proyecto_id

      t.timestamps
    end
  end
end

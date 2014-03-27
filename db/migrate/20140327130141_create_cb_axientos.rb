class CreateCbAxientos < ActiveRecord::Migration
  def change
    create_table :cb_axientos do |t|
      t.string :nombre
      t.integer :proyecto_id

      t.timestamps
    end
  end
end

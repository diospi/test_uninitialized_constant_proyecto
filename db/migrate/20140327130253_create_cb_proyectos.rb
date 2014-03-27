class CreateCbProyectos < ActiveRecord::Migration
  def change
    create_table :cb_proyectos do |t|
      t.string :name

      t.timestamps
    end
  end
end

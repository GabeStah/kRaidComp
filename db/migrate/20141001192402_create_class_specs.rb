class CreateClassSpecs < ActiveRecord::Migration
  def change
    create_table :class_specs do |t|
      t.string :name

      t.timestamps
    end
  end
end

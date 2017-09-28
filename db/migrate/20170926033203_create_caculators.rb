class CreateCaculators < ActiveRecord::Migration
  def change
    create_table :caculators do |t|

      t.timestamps null: false
    end
  end
end

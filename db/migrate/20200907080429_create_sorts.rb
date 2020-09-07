class CreateSorts < ActiveRecord::Migration[6.0]
  def change
    create_table :sorts do |t|

      t.timestamps
    end
  end
end

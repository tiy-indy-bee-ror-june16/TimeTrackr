class ChangeValuetoInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :timers, :value, :integer, default: 0
  end

end

class StaffSection < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :section, :string
  end

  def down
    remove_column :refinery_staffs, :section
  end
end

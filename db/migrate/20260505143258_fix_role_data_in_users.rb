class FixRoleDataInUsers < ActiveRecord::Migration[7.2]
  def change
    execute("UPDATE users SET role = CAST(role AS UNSIGNED)")
  end
end

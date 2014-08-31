class AddCheckedInToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :checked_in, :boolean
  end
end

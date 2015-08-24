class ListId < ActiveRecord::Migration
  def change
    add_column(:tasks, :list_id, :int)
  end
end

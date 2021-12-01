class CreateJoinTableCategoryEntity < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :entities do |t|
      # t.index [:category_id, :entity_id]
      # t.index [:entity_id, :category_id]
    end
  end
end

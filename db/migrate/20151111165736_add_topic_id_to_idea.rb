class AddTopicIdToIdea < ActiveRecord::Migration
  def up
    change_column :ideas, :topic_id, :integer
  end
end

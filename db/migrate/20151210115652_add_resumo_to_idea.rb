class AddResumoToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :resumo, :text
  end
end

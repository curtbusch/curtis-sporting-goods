class Dtype < ActiveRecord::Migration[5.1]
  def change
    change_column :pages, :body, :text
  end
end

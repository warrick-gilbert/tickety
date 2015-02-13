class AddTitleAndDescriptionToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :title, :string
    add_column :tickets, :description, :text
  end
end

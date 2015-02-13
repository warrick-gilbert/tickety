class AddFixerReferencesToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :fixer_id, :integer
  end
end

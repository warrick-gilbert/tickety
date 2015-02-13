require 'rails_helper'

RSpec.describe Ticket, type: :model do

   describe "Validations" do

    def ticket_attributes(new_attributes)  # create a new ticket
      valid_attributes = {title: "valid title",
                          description: "valid desc"}
      valid_attributes.merge(new_attributes)
    end

    it "requires a title" do
      ticket = Ticket.new(ticket_attributes({title: nil}))
      expect(ticket).to be_invalid
    end

    it "requires a description" do
      ticket = Ticket.new(ticket_attributes({description: nil}))
      expect(ticket).to be_invalid
    end

  end
end

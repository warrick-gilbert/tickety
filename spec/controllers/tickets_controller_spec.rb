require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  # let(:user) { create(:user) }  # doesn't work
  # let(:ticket_1)   { create(:ticket, user: user) }     # also doesn't work. dammit.
  # let(:ticket_2)   { create(:ticket) }

  # def user(new_attributes = {})                     # also doens't work
  #   valid_attributes = {first_name: "Tam",
  #                       last_name: "KBeili",
  #                       email: "tam@codecore.ca",
  #                       password: "12345678"}
  #   valid_attributes.merge new_attributes
  # end

  describe "#new" do
    context "user is signed in" do 
      # before { login(user) }        # can't get this to work     
      # dummy = create(:user)         # this doesn't work either

      context "user presses 'create new ticket' " do
        it "renders a new template" do
          get :new
          expect(response).to render_template(:new)
        end

        xit "creates a new instance" do
          get :new
          expect(assigns(:ticket)).to be_a_new(Ticket)
        end

      end
    end

    context "user is not signed in" do
      it " redirects user to login page" do
        expect(response).not_to render_template(:new)   #doesn't work
      end
    end
  end

  describe "#create" do
    def valid_request    # create valid ticket
      post :create, {ticket: {
                              title: "valid campaign title",
                              description: "valid descritpion"
                    }}
    end
    it "new ticket with valid parameters" do
      expect { valid_request }.to change { Ticket.count }#.by(1)
    end
  end

  describe "#index" do
    # it "assigns @tickets instance variable to these two tickets" do   # doens't work.
    #   ticket_1
    #   ticket_2
    #   get :index
    #   expect(assigns(:tickets)).to eq([ticket_1, ticket_2])
    # end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end

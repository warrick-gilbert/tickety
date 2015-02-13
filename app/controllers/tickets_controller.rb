class TicketsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]      # had to knock this out for testing

  def index
    @tickets = Ticket.order(:id)
    # render text: @tickets.first.title
  end

  def new
    @ticket = Ticket.new
    
  end

  def create
    # @ticket = current_user.ticket.new(ticket_attributes)  # what is this doing?
    @ticket = Ticket.new ticket_params
    @ticket.save

    redirect_to tickets_path
  end


  private

  def find_ticket
    #@question = Question.find(params[:question_id] || params[:id])
    # @question = current_user.questions.find(params[:question_id] || params[:id])
    @tickets = current_user.tickets.find_by_id(params[:id])
    # redirect_to root_path, alert: "Access Denied" unless @ticket
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

end

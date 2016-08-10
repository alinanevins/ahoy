class ConsultationsController < ApplicationController
  before_action :authenticate_user!
  require 'csv'

  def all
    @consultation = Consultation.all
    # client name autocomplete
    @availableClient = []

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"all-consultations.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end

  end

  def index
@consultation = Consultation.all
# @consultation = Consultation.where {|a| a.user_id.to_s == ['current_user.id']}
    # @consultation = current_user.consultations
    # binding.pry

    # client name autocomplete
    @availableClient = []
  end

  def create
    consultation_hash = params.delete('consultation')
    @consultation = Consultation.new
    @consultation.clientname = consultation_hash['clientname']
    @consultation.user_id = consultation_hash['user_id']
    @consultation.date = consultation_hash['date']
    @consultation.focus = consultation_hash['focus']
    @consultation.link_to_notes = consultation_hash['link_to_notes']

    if @consultation.user_id.first == nil
      @consultation.user_id.delete_at(0)
    end

    if @consultation.save
      redirect_to consultation_path(@consultation.id)
    end

    # Client Name
    if @consultation.clientname != nil
      @client_name_array = @consultation.clientname.split(' ')
      @client_first_name = @client_name_array.first
      @client_last_name = @client_name_array.last

      temp_client = Client.where(full_name: @consultation.clientname).first_or_create do |client|
        client.first_name = @client_first_name
        client.last_name = @client_last_name
      end
      @consultation.client_id = temp_client.id
      @consultation.save
    end
  end

  def new
    @consultation = Consultation.new

    # client name autocomplete
    @availableClient = []
    Client.all.each do |client|
      @clientname = client.full_name
      @availableClient << @clientname
    end

    @current_user_id = current_user.id

  end

def show
  id = params[:id]
  @consultation = Consultation.find(id)
  # client name autocomplete
  @availableClient = []
end

def edit
  id = params[:id]
  @consultation = Consultation.find(id)

  # client name autocomplete
  @availableClient = []

  @selected = @consultation.user_id

  Client.all.each do |client|
    @clientname = client.full_name
    @availableClient << @clientname
  end
end

def update
  id = params[:id]
  consultation_hash = params.delete('consultation')
  @consultation = Consultation.new
  @consultation.clientname = consultation_hash['clientname']
  @consultation.user_id = consultation_hash['user_id']
  @consultation.date = consultation_hash['date']
  @consultation.focus = consultation_hash['focus']
  @consultation.link_to_notes = consultation_hash['link_to_notes']
  if @consultation.user_id.first == nil
    @consultation.user_id.delete_at(0)
  end
  if @consultation.save
    redirect_to consultation_path(@consultation.id)
  end

  # Client Name
  if @consultation.clientname != nil
    @client_name_array = @consultation.clientname.split(' ')
    @client_first_name = @client_name_array.first
    @client_last_name = @client_name_array.last

    temp_client = Client.where(full_name: @consultation.clientname).first_or_create do |client|
      client.first_name = @client_first_name
      client.last_name = @client_last_name
    end
    @consultation.client_id = temp_client.id
    @consultation.save
  end
end

def destroy
  id = params[:id]
  Consultation.delete(id)
  flash[:notice] = "Consultation #{id} was successfully deleted"
  redirect_to "/"
end
end

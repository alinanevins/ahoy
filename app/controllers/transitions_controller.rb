class TransitionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transition = Transition.where(user_id: current_user.id)

    # client name autocomplete
    @availableClient = []
  end

  def create
    transition_hash = params.delete('transition')
    @transition = Transition.new
    @transition.user_id = current_user.id
    @transition.clientname = transition_hash['clientname']
    @transition.course = transition_hash['course']
    @transition.date = transition_hash['date']
    @transition.link = transition_hash['link']
    # date?
    if @transition.save
      redirect_to transition_path(@transition.id)
    end

    # Client Name
    if @transition.clientname != nil
      @client_name_array = @transition.clientname.split(' ')
      @client_first_name = @client_name_array.first
      @client_last_name = @client_name_array.last

      temp_client = Client.where(full_name: @transition.clientname).first_or_create do |client|
        client.first_name = @client_first_name
        client.last_name = @client_last_name
      end
      @transition.client_id = temp_client.id
      @transition.save
    end
  end

  def new
    @transition = Transition.new

    @availableClient = []
    Client.all.each do |client|
      @clientname = client.full_name
      @availableClient << @clientname
    end
  end

  def show
    id = params[:id]
    @transition = Transition.find(id)

    @userid = @transition.user_id
    a = User.find(@userid)
    @transitioner_name = a.first_name.to_s + " " + a.last_name.to_s

    @client_id = @transition.client_id
    if @client_id != nil && @client_id != 0
      b = Client.find(@client_id)
      @client_name = b.full_name
    end

    # client name autocomplete
    @availableClient = []
  end

  def edit
    id = params[:id]
    @transition = Transition.find(id)

    # client name autocomplete
    @availableClient = []
    Client.all.each do |client|
      @clientname = client.full_name
      @availableClient << @clientname
    end
  end

  def update
    id = params[:id]
    transition_hash = params.delete('transition')
    @transition = Transition.new
    @transition.user_id = current_user.id
    @transition.clientname = transition_hash['clientname']
    @transition.course = transition_hash['course']
    @transition.date = transition_hash['date']
    @transition.link = transition_hash['link']
    # date?
    if @transition.save
      redirect_to transition_path(@transition.id)
    end

    # Client Name
    if @transition.clientname != nil
      @client_name_array = @transition.clientname.split(' ')
      @client_first_name = @client_name_array.first
      @client_last_name = @client_name_array.last

      temp_client = Client.where(full_name: @transition.clientname).first_or_create do |client|
        client.first_name = @client_first_name
        client.last_name = @client_last_name
      end
      @transition.client_id = temp_client.id
      @transition.save
    end
  end

  def destroy
    id = params[:id]
    Transition.delete(id)
    flash[:notice] = "The transition was successfully deleted"
    redirect_to "/"
  end
end

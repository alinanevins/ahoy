class ClientsController < ApplicationController
  before_action :authenticate_user!
  require 'csv'

  def all
    @client = Client.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"all-clients.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def index
    @client = Client.all
  end

  def create
    client_hash = params.delete('client')
    @client = Client.new
    @client.first_name = client_hash['first_name']
    @client.last_name = client_hash['last_name']
    @client.full_name = @client.first_name + " " + @client.last_name
    @client.email = client_hash['email']
    @client.phone = client_hash['phone']
    @client.school = client_hash['school']
    @client.department = client_hash['department']
    @client.notes = client_hash['notes']
    @client.role = client_hash['role']

    if @client.role.first == ""
      @client.role.delete_at(0)
    end

    if @client.save
      redirect_to client_path(@client.id)
    end
  end

  def new
    @client = Client.new
  end

  def show
    id = params[:id]
    @client = Client.find(id)
    if @client.role != nil
      @client_role = @client['role'].map { |x| x}.join(", ")
    else
      @client_role = "n/a"
    end
  end

  def edit
    id = params[:id]
    @client = Client.find(id)
    @selected = @client.role
    @role_options = ['Faculty', 'Canvas Admin', 'Teaching Assistant', 'Department Admin', 'Librarian', 'Other']
    @roles_selected = @selected.select{ |x| !@role_options.include?(x) }
  end

  def update
    id = params[:id]
    client_hash = params.delete('client')
    @client = Client.find(id)
    @client.first_name = client_hash['first_name']
    @client.last_name = client_hash['last_name']
    @client.email = client_hash['email']
    @client.phone = client_hash['phone']
    @client.school = client_hash['school']
    @client.department = client_hash['department']
    @client.notes = client_hash['notes']
    @client.role = client_hash['role']
    if @client.role != nil
      if @client.role.first == ""
        @client.role.delete_at(0)
      end
    end
    if @client.save
      redirect_to client_path(@client.id)
    end
  end

  def destroy
    id = params[:id]
    Client.delete(id)
    flash[:notice] = "Client #{first_name.to_s + " " + last_name.to_s} was successfully deleted"
    redirect_to "/"
  end
end

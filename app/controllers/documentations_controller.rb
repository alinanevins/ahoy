class DocumentationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documentation = Documentation.where(user_id: current_user.id)
  end

  def create
    documentation_hash = params.delete('documentation')
    @documentation = Documentation.new
    @documentation.user_id = current_user.id
    @documentation.name = documentation_hash['name']
    @documentation.audience = documentation_hash['audience']
    @documentation.summary = documentation_hash['summary']
    @documentation.link_to_documentation = documentation_hash['link_to_documentation']

    if documentation_hash['audience_other'] != ""
      @documentation.audience << documentation_hash['audience_other']
    end

    if @documentation.audience.first == ""
      @documentation.audience.delete_at(0)
    end

    if @documentation.save
      redirect_to documentation_path(@documentation.id)
    end

  end

  def new
    @documentation = Documentation.new
  end

  def show
    id = params[:id]
    @documentation = Documentation.find(id)

    @userid = @documentation.user_id
    a = User.find(@userid)
    @consultant_name = a.first_name.to_s + " " + a.last_name.to_s

  end

  def edit
    id = params[:id]
    @documentation = Documentation.find(id)
    @selected = @documentation.audience

    @audience_options = ['Faculty', 'Teaching Assistants', 'Department Admins', 'Canvas Admins', 'Help Desk', 'Students']
    @audience_other_entered = @selected.select{ |x| !@audience_options.include?(x) }

    if @documentation.audience.first == ""
      @documentation.audience.delete_at(0)
    end

  end

  def update
    id = params[:id]
    documentation_hash = params.delete('documentation')
    @documentation = Documentation.find(id)
    @documentation.user_id = documentation_hash['user_id']
    @documentation.name = documentation_hash['name']
    @documentation.audience = documentation_hash['audience']
    @documentation.summary = documentation_hash['summary']
    @documentation.link_to_documentation = documentation_hash['link_to_documentation']
    if documentation_hash['audience_other'] != ""
      @documentation.audience << documentation_hash['audience_other']
    end
    if @documentation.save
      redirect_to documentation_path(@documentation.id)
    end
  end

  def destroy
    id = params[:id]
    Documentation.delete(id)
    flash[:notice] = "Documentation #{name} was successfully deleted"
    redirect_to "/"
  end
end

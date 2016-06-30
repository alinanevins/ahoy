class DocumentationsController < ApplicationController
  def index
    @documentation = Documentation.all
  end

  def create
    documentation_hash = params.delete('documentation')
    a = Documentation.new
    a.user_id = documentation_hash['user_id']
    a.name = documentation_hash['name']
    a.audience = documentation_hash['audience']
    a.link_to_documentation = documentation_hash['link_to_documentation']
    if a.save
      redirect_to documentation_path(a.id)
    end
  end

  def new
    @documentation = Documentation.new
  end

  def show
    id = params[:id]
    @documentation = Documentation.find(id)
  end

  def edit
    id = params[:id]
    @documentation = Documentation.find(id)
  end

  def update
    id = params[:id]
    documentation_hash = params.delete('documentation')
    @documentation = Documentation.find(id)
    @documentation.user_id = documentation_hash['user_id']
    @documentation.name = documentation_hash['name']
    @documentation.audience = documentation_hash['audience']
    @documentation.link = documentation_hash['link']
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

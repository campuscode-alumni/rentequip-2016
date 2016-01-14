class ToolsGroupsController < ApplicationController
before_action :set_tools, only: [:edit, :update, :show]

  def index
    @toolsgroup = ToolsGroup.all
  end

  def edit
  end

  def new
    @toolsgroup = ToolsGroup.new
  end

  def show
  end

  def create
    @toolsgroup = ToolsGroup.new(tools_params)
    if @toolsgroup.save
      redirect_to @toolsgroup
    else
      flash[:warning] = 'Atenção! Todos os campos são obrigatórios.'
      render :new
    end
  end

  def update
    if @toolsgroup.update(tools_params)
      redirect_to @toolsgroup
    else
      flash[:warning] = 'Atenção! Todos os campos são obrigatórios.'
      render :edit
    end
  end

  private

  def tools_params
    params.require(:tools_group).permit(:name)
  end

  def set_tools
    @toolsgroup = ToolsGroup.find(params[:id])
  end
end

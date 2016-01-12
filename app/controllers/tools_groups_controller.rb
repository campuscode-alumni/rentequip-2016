class ToolsGroupsController < ApplicationController
  def index
    @toolsgroup = ToolsGroup.all
  end

  def new
    @toolsgroup = ToolsGroup.new
  end

  def show
    @toolsgroup = ToolsGroup.find(params[:id])
  end

  def create
    @toolsgroup = ToolsGroup.new(tools_params)
    if @toolsgroup.save
      redirect_to @toolsgroup
    else
      flash[:warning] = 'Warning! All fields are mandatory.'
      render :new
    end
  end

  private

  def tools_params
    params.require(:tools_group).permit(:name)
  end
end

class GossipsController < ApplicationController
  def index
    @gossip = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(gossip_params)
    if @gossip.save
      flash[:success] = "Gossip created!"
      redirect_to @gossip
    else
      flash[:danger] = "Gossip wasn't created!"
      redirect_to new_gossip_path
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)

    flash[:success] = "Updated successfully."
    redirect_to gossips_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    flash[:success] = "Deleted successfully."
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:user_id, :title, :content)
  end
  
end

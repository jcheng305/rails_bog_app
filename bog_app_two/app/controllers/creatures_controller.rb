class CreaturesController < ApplicationController
  #This will render the index
  def index
    @creatures = Creature.all
  end

  #this will show new creatures
  def new
    @creature = Creature.new
  end

  # this will create creatures

  def create
    # whitelist params
    creature_params = params.require(:creature).permit(:name, :description)
    # create a new creature in the database from the params
    creature = Creature.new(creature_params)
    # if creature saves, redirect to route that displays all creatures
    if creature.save
      redirect_to creatures_path(creature)
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
  end
end

  #show
  def show
    creature_id = params[:id]

    @creature = Creature.find_by_id(creature_id)
  end

  #edit
  def edit
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  #update
  def update
    creature_id = params[:id]
    creature = Creature.find_by_id(creature_id)
    creature_params = params.require(:creature).permit(:name, :description)
    creature.update_attributes(creature_params)
    redirect_to creature_path(creature)
  end

  # delete
  def destroy
    creature_id = params[:id]
    creature = Creature.find_by_id(creature_id)
    creature.destroy
    redirect_to creatures_path
  end

  private

def creature_params
  # whitelist params return whitelisted version
  params.require(:creature).permit(:name, :description)
end


end

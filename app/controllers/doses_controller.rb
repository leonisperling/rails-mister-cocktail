class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(@dose.cocktail), notice: 'dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_dose
    @dose = Dose.find(params[:dose_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

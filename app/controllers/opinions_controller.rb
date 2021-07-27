class OpinionsController < ApplicationController
  def create
    opinion = current_user.opinions.build(opinion_params)

    if opinion.save
      redirect_to root_path
    else
      render :back, alert: 'Couldn\'t save your rating :('
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end

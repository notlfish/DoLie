class OpinionsController < ApplicationController
  def create
    opinion = current_user.opinions.build(opinion_params)

    if opinion.save
      Mention.create_from_opinion(opinion)
      redirect_to(root_path)
    else
      redirect_back alert: 'Couldn\'t save your rating :(',
                    fallback_location: root_path,
                    flash: { error: opinion.errors.full_messages.join(', ') }
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end

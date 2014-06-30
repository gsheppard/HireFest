class JobsController < ApplicationController

  def index
    @jobs = Job.all

    # response = HTTParty.get('https://hn.algolia.com/api/v1/items/7829042')

    # response["children"].each do |comment|

    # end
  end

  def refresh

    respond_to do |format|
      format.json { render json: { data: params["post_id"] } }
      format.html { redirect_to root_path }
    end
  end

end

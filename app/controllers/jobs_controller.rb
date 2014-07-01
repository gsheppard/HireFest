class JobsController < ApplicationController

  def index
    @jobs = Job.all

    # response = HTTParty.get('https://hn.algolia.com/api/v1/items/7829042')

    # response["children"].each do |comment|

    # end
  end

  def refresh
    api_call

    respond_to do |format|
      format.json { render json: { data: params["post_id"] } }
      format.html { redirect_to root_path }
    end
  end

  private
  def api_call
    # call to the API
    response = HTTParty.get("https://hn.algolia.com/api/v1/items/" + params[:post_id])
    jobs = response["children"]

    job_objects = jobs.map do |j|
      Job.new(
        id: j["id"],
        author: j["author"],
        body: j["text"],
        date_posted: j["created_at"]
      )
    end

    Job.import(job_objects)
  end

end

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

    # Parses links from <a> tags
    meta = {}
    jobs.each do |j|
      meta[j["id"].to_s] = {}
      meta[j["id"].to_s]["a"] = Nokogiri::HTML(j["text"]).xpath('//a').map do |a|
        a.attributes["href"].value
      end

      meta[j["id"].to_s]["p"] = Nokogiri::HTML(j["text"]).xpath('//p').map do |p|
        p.text
      end

      # meta[j["id"].to_s]["location"] = Geocoder.search(meta[j["id"].to_s]["p"].first)
    end

    binding.pry
  end

end

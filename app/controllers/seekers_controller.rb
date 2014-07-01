class SeekersController < ApplicationController
  def index
    @seekers = Seeker.all
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
    response = HTTParty.get("https://hn.algolia.com/api/v1/items/" + params[:post_id])
    seekers = response["children"]

    seeker_objects = seekers.map do |s|
      if Seeker.exists?(s["id"])
        binding.pry
        parse_data(s["text"])

        Seeker.new(
          id: s["id"],
          author: s["author"],
          body: s["text"],
          date_posted: s["created_at"]
        )
      end
    end

    Seeker.import(seeker_objects)
  end

  def parse_data text
    html = Nokogiri::HTML(text).xpath('//p')
    data = {}

    if html.first.text.include?("\\n")
      html = html.first.text.split('\\n')

      regex = /^\w*:/ # strips everything before a colon (i.e. Location:)
      data[:location] = Geocoder.search(html[0].gsub(regex, ''))
      data[:remote] = html[1].gsub(regex, '')
      data[:relocate] = html[2].gsub(regex, '')
      data[:technologies] = html[3].gsub(regex, '')
      data[:resume] = html[4].gsub(regex, '')
      data[:email] = html[5].gsub(regex, '')
      binding.pry
    else
      binding.pry
    end

  end
end

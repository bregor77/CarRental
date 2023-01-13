# frozen_string_literal: true

# Car Controller (example of top-level documentation comment)
class CarController < ApplicationController
  def index
    # *** Using the API 1 (Weather) ***
    data = CurrentWeatherService.new(latitude: '53.3498', longitude: '-6.266155',
                                     units: 'metric').call
    # instantiate the "data"
    @weather = Weather.new(data)

    # *** Using the API 2 (Daily News) *** ver. 1
    # @currentdate = Date.today
    # url2 = "https://newsapi.org/v2/everything?q='tesla elon musk'&from=@currentdate&sortBy=publishedAt&language=en&apiKey=186c5be645b046d0a0abcc71971e6867"
    # uri2 = URI(url2)
    # res = Net::HTTP.get_response(uri2)
    # raise     ## to show the console in the browser for test purposes
    # puts res.body if res.is_a?(Net::HTTPSSuccess)
    # @data2 = JSON.parse(res.body)

    # *** Using the API 2 (Daily News) *** ver. 2 - better
    @currentdate = Time.zone.today
    data2 = DailyNewsService.new(querry: 'tesla elon musk', sortby: 'publishedAt',
                                 from: '@currentdate', language: 'en').call
    # instantiate the "data2"
    @news = News.new(data2)
  end
end

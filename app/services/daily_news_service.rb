# frozen_string_literal: true

# Services for API Daily News
class DailyNewsService
  # https://newsapi.org/v2/everything?q='tesla elon musk'&from=2022-12-22&to=2022-12-22&sortBy=publishedAt&language=en&apiKey=186c5be645b046d0a0abcc71971e6867
  BASE_URL2 = 'https://newsapi.org/v2/everything'
  API_KEY2 = '186c5be645b046d0a0abcc71971e6867'
  # API_KEY2 = ENV['DAILY_NEWS_API_KEY']

  def initialize(querry:, from:, sortby:, language:)
    @querry = querry
    @sortby = sortby
    @from = from
    @language = language
  end

  def call
    response = Net::HTTP.get_response(uri2)
    JSON.parse(response.body)
  end

  private

  attr_reader :querry, :from, :sortby, :language

  def uri2
    return @uri2 if defined?(@uri2)

    # setting uri2
    @uri2 = URI(BASE_URL2)
    # setting different parameters as a query
    params = { q: querry, from:, sortBy: sortby, language:, apiKey: API_KEY2 }
    @uri2.query = URI.encode_www_form(params)
    # returning it
    @uri2
  end
end

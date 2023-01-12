# frozen_string_literal: true

# Daily News model used for second API
class News
  # initializing JSON data for "data2"
  def initialize(data2)
    @data2 = data2.with_indifferent_access
  end

  # methods declaring parameters retrieved as JSON data for News 1
  def title1
    daily_news1[:title]
  end

  def description1
    daily_news1[:description]
  end

  def content1
    daily_news1[:content]
  end

  def url_to_image1
    daily_news1[:urlToImage]
  end

  def url1
    daily_news1[:url]
  end

  # methods declaring parameters retrieved as JSON data for News 2
  def title2
    daily_news2[:title]
  end

  def description2
    daily_news2[:description]
  end

  def content2
    daily_news2[:content]
  end

  def url_to_image2
    daily_news2[:urlToImage]
  end

  def url2
    daily_news2[:url]
  end

  # methods declaring parameters retrieved as JSON data for News 3
  def title3
    daily_news3[:title]
  end

  def description3
    daily_news3[:description]
  end

  def content3
    daily_news3[:content]
  end

  def url_to_image3
    daily_news3[:urlToImage]
  end

  def url3
    daily_news3[:url]
  end

  private

  attr_reader :data2

  # News 1 method for a first set of objects in the array "articles"
  def daily_news1
    @daily_news1 ||= data2[:articles][0]
  end

  # News 2 method for a second set of objects in the array "articles"
  def daily_news2
    @daily_news2 ||= data2[:articles][1]
  end

  # News 3 method for a third set of objects in the array "articles"
  def daily_news3
    @daily_news3 ||= data2[:articles][2]
  end
end

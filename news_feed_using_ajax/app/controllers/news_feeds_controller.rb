class NewsFeedsController < ApplicationController
  def index
    @news_feeds = NewsFeed.all
  end

  def get_new_data
    @news_feeds = NewsFeed.all
    render :partial => "list_news_feeds", :locals => {:news_feeds => @news_feeds}
  end

  def new
    @news_feed = NewsFeed.new
  end

  def create
    @news_feed = NewsFeed.new(params[:news_feed])
    
    if @news_feed.save
      redirect_to :back, notice: 'News feed is successfully created'
    else
      render action: "new"
    end
  end
end

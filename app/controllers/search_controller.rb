class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @articles = []
    else
      term = params[:term]
      @articles = Article.search term, fields: [:text], highlight:  true
    end
  end
end

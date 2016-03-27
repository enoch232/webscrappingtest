class PostsController < ApplicationController
  def index
	  	#! /usr/bin/env ruby

	require 'nokogiri'
	require 'open-uri'

	# Fetch and parse HTML document
	url = 'http://www.ebay.com/sch/i.html?_odkw=galaxy+s7&_osacat=0&_from=R40&_trksid=p2045573.m570.l1313.TR3.TRC2.A0.H0.Xgalaxy+s7+edge.TRS0&_nkw=galaxy+s7+edge&_sacat=0'
	doc = Nokogiri::HTML(open(url))

	doc.css('.li').each do |content|
		@titles ||= ""
		@prices ||= ""
		@titles = @titles +".."+ content.at_css('.vip, strong').text
		@prices = @prices +".."+ content.at_css('.prc .bold').text
	end
	@titles = @titles.split("..")
	@prices = @prices.split("..")
  end

end

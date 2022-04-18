require 'pry'
require 'nokogiri'
require 'watir'

class Scraper

	attr_accessor :url, :browser, :content

	def initialize(url="")
		@url = set_url(url)
		@browser = Watir::Browser.new(:firefox, headless: true)
		@content = set_content unless url.empty?
	end

	def set_content
		@browser.goto(@url)
		@content = Nokogiri::HTML(browser.html)
	end

	def set_url(url)
		@url = url
	end

	def get_element_by_class(element_type, class_name)
		return false if @content.nil?
		@content.css("#{element_type}.#{class_name}").map do |item|
			item.content
		end
	end

	def get_element_by_id(element_type, id)
		return false if @content.nil?
	end
end
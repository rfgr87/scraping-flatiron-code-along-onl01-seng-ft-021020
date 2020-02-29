require 'nokogiri'
require 'open-uri'
require 'pry'
 
require_relative './course.rb'

class Scraper
  
  def initialize
    @course
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  
  def get_courses
  doc = self.get_page.css("#course-grid")
  end


  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
  end
end
    
  #   self.get_courses.each do |post|
  #   course = Course.new
  #   course.title = post.css("h2").text
  #   course.schedule = post.css(".date").text
  #   course.description = post.css("p").text
  # end
  
  
  def get_page
    
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
    # doc Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
   
   def self.get_courses 
    doc.select do |x|
      binding.pry
      @courses << Course.new(
        x.css("h2").text,
        x.css(".date").text, 
        x.css("p").text
        )
      end
    end 
  
end

# Scraper.new.print_courses


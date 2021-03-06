require 'simplecov_test_helper' # should be first for some reason

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	# Add more helper methods to be used by all tests here...
end

require 'html_test'

class TestController < ActionController::Base
	prepend_view_path(File.dirname(__FILE__))

	layout nil
	def valid; render :file => TestController.test_action(:valid), :format => :html end
	def untidy; render :file => TestController.test_action(:untidy), :format => :html end
	def invalid; render :file => TestController.test_action(:invalid), :format => :html end

	def url_no_route
		render :text => %Q{<a href="/norouteforthisurl">No route</a>}
	end

	def url_no_route_relative
		render :text => %Q{<a href="norouteforthisurl">No route</a>}		
	end

	def url_no_action
		render :text => %Q{<a href="/test/thisactiondoesnotexist">no action</a>}
	end

	def action_no_template
		render :text => %Q{<a href="/test/valid">valid</a>}
	end

	def redirect_no_action
		redirect_to :action => 'thisactiondoesnotexist'
	end

	def redirect_valid_action
		redirect_to :action => 'valid'
	end

	def redirect_external
		redirect_to "http://google.com/foobar"
	end

	def redirect_valid_with_host
		redirect_to "http://test.host/test/valid"
	end

	def image_file_exists
		render :text => %Q{<img src="/image.jpg?23049829034"/>}
	end

	def image_file_does_not_exist
		render :text => %Q{<img src="/image2.jpg?23049829034"/>}
	end

	def self.test_action(action)
		File.join(File.dirname(__FILE__), "#{action}")
	end

	def self.test_file(action)
		"#{test_action(action)}.html"
	end

	def self.test_file_string(action)
		IO.read(test_file(action))
	end
	
	# Re-raise errors caught by the controller.
	def rescue_action(e)
		raise e
	end
end

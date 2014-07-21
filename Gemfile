source 'https://rubygems.org'

#
#	None of this is needed in production.  Unfortunately, jeweler
#	will use the Gemfile to set gem dependencies that aren't really
#	required.
#
group :test do


#	minitest-5.3.4/lib/minitest.rb
#	still true in 5.4.0.  May need to just redefine the offending method.
#	test classes are purposely shuffled!  Only change in this version!  Why?
#	Random is stupid.  Unpredictable.  Poor testing strategy.
#	144: suites = Runnable.runnables.shuffle
#	remove this requirement if can find a way around
gem 'minitest', '= 5.3.3'




	gem 'rails', '~> 4.0'	#'~> 3.2'

	gem "jeweler"

	gem "test-unit"

	gem "simplecov", :require => false

#	gem "mocha", '0.13.3', :require => false #	0.14.0 seems to require unstubbing
	gem "mocha", :require => false #	0.14.0 seems to require unstubbing

	gem "autotest-rails", :require => 'autotest/rails'

#	gem 'ZenTest', '=4.9.1'
	gem 'ZenTest'	#, '=4.9.1'

end

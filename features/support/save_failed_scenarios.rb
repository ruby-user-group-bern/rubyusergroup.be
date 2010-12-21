# Hook to save the html page of every failed scenario into the temp
# file directory taht it can be checked after cucumber has finished running.
require 'fileutils'
require 'capybara/util/save_and_open_page'
FAILED_SCENARIO_PAGES_PATH = File.join Rails.root, 'tmp', 'failed_scenarios'

FileUtils.rm_rf FAILED_SCENARIO_PAGES_PATH


After do |scenario|
  if scenario.failed?
    begin
      FileUtils.makedirs(FAILED_SCENARIO_PAGES_PATH) unless File.exists?(FAILED_SCENARIO_PAGES_PATH)
      name = scenario.name
      name = "#{scenario.scenario_outline.name}_00_#{name}" if scenario.respond_to? :scenario_outline

      filename = "#{name.parameterize}.html"
      File.open File.join(FAILED_SCENARIO_PAGES_PATH, filename), 'w+' do |f|
        f.write Capybara.send(:rewrite_css_and_image_references, page.body)
      end
    rescue Rack::Test::Error
    end
  end
end

# frozen_string_literal: true
require 'vcr'
require 'rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'test/vcr_cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!
  c.ignore_request do |req|
    #Temprarily excluding workflow requests
    #req.uri =~ /workflow/
  end
end

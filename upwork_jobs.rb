require 'upwork/api'
require 'upwork/api/routers/auth'
require 'upwork/api/routers/reports/time'
require 'upwork/api/routers/freelancers/search'
require 'upwork/api/routers/jobs/search'

class UpworkJobs
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def find
    search.find(params)
  end

  private

  def config
    Upwork::Api::Config.new({
      'consumer_key'    => ENV.fetch("UPWORK_CONSUMER_KEY"),
      'consumer_secret' => ENV.fetch("UPWORK_CONSUMER_SECRET"),
      'access_token'    => ENV.fetch("UPWORK_ACCESS_TOKEN"),
      'access_secret'   => ENV.fetch("UPWORK_ACCESS_SECRET")
    })
  end

  def client
    Upwork::Api::Client.new(config)
  end

  def search
    Upwork::Api::Routers::Jobs::Search.new(client)
  end
end

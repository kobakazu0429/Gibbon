require_relative "../../application_controller.rb"

module Api
  module V1
    class BaseController < ApplicationController
      before do
        headers 'Access-Control-Allow-Origin' => '*'
        headers 'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept'
      end
    end
  end
end

require 'active_model'

module ActiveModel
  class Errors
    def merge!(errors)
      messages.merge!(errors.messages)
    end
  end
end

module Eldr
  module Action
    def self.included(klass)
      klass.include ActiveModel::Validations
      klass.attr_accessor :configuration, :env, :status, :body, :header
    end

    def header
      @header ||= {}
    end

    def body
      @body ||= ''
    end

    def valid?
      errors.count == 0
    end

    def params
      env['eldr.params']
    end

    def self.configuration
      @configuration ||= Configuration.new()
    end

    def initialize(configuration: Configuration.new)
      @configuration = configuration
      @configuration.merge! self.class.configuration.to_h
    end

    def config
      configuration
    end

    def to_array
      [status, header, [body]]
    end
  end
end

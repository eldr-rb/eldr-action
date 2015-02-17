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
    class << self
      def included(klass)
        klass.include ActiveModel::Validations
        klass.send(:attr_accessor, :env, :configuration, :status, :body, :header)
      end

      def configuration
        @configuration ||= Configuration.new
      end
      alias_method :config, :configuration

      def set(key, value)
        configuration.set(key, value)
      end

      def inherited(base)
g        base.configuration.merge!(configuration)
      end
    end

    def initialize(configuration = nil)
      configuration ||= self.class.configuration
      @configuration = configuration
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

    def to_a
      [status, header, [body]]
    end
    alias_method :to_ary, :to_a
  end
end

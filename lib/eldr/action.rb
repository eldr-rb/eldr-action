require 'active_model'

module ActiveModel
  class Errors
    def merge!(errors)
      messages.merge!(errors.messages)
    end
  end
end

module Eldr
  class Action
    include ActiveModel::Validations
    attr_accessor :env, :configuration, :status, :body, :header

    class << self
      def configuration
        @configuration ||= Configuration.new
      end
      alias_method :config, :configuration

      def set(key, value)
        configuration.set(key, value)
      end

      def inherited(base)
        base.configuration.merge!(configuration)
      end
    end

    def configuration
      @configuration ||= self.class.configuration
    end
    alias_method :config, :configuration

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

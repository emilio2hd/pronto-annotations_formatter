# frozen_string_literal: true

require "pronto/formatter/base"

require_relative "annotations_formatter/version"

module Pronto
  module Formatter
    class AnnotationsFormatter < Pronto::Formatter::Base
      # {
      #   "message": "Some message",
      #   "level": "warning",
      #   "file": "some_file.rb",
      #   "line": { "start": 1, "end": 1 },
      #   "title": "The warning issuer, the runner"
      # }
      def format(messages, _repo, _patches)
        messages.map { |m| build_report_line(m) }.to_json
      end

      private

      def build_report_line(message)
        lineno = message.line.new_lineno if message.line

        result = {
          message: message.msg,
          level: get_github_level(message.level)
        }
        result[:file] = message.path if message.path
        result[:line] = { start: lineno, end: lineno } if lineno
        result[:title] = message.runner if message.runner

        result
      end

      def get_github_level(pronto_level)
        case pronto_level
        when :error, :fatal
          "error"
        when :warning
          "warning"
        else
          "notice"
        end
      end
    end
  end

  module AnnotationsFormatterMonkeypatch
    ANNOTATION_OPTION = "annotations"
    ORIGINAL_FORMATTERS = {}.freeze

    # Get Pronto::Formatter::FORMATTERS constant and set a new one, adding the annotations leading to new formatter.
    # As FORMATTERS is a frozen hash, it's required remove it and set a new one with the new option.
    def self.apply_patch
      return unless Pronto::Formatter.const_defined?(:FORMATTERS)
      return if Pronto::Formatter::FORMATTERS.keys.include?(ANNOTATION_OPTION)

      formatters_const = Pronto::Formatter.const_get(:FORMATTERS)
      Pronto::Formatter.send(:remove_const, :FORMATTERS)

      send(:remove_const, :ORIGINAL_FORMATTERS)
      const_set(:ORIGINAL_FORMATTERS, formatters_const)
      Pronto::Formatter.const_set(
        :FORMATTERS,
        formatters_const.merge(ANNOTATION_OPTION => Pronto::Formatter::AnnotationsFormatter).freeze
      )
    end

    apply_patch
  end
end

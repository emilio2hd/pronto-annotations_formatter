# frozen_string_literal: true

require "pronto/formatter/formatter"
require "pronto/formatter/base"

require_relative "annotations_formatter/version"

module Pronto
  module Formatter
    class AnnotationsFormatter < Pronto::Formatter::Base
      def self.name
        "annotations"
      end

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
end

Pronto::Formatter.register(Pronto::Formatter::AnnotationsFormatter)

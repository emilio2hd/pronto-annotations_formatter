# frozen_string_literal: true

module Pronto
  module Formatter
    describe AnnotationsFormatter do
      let(:formatter) { described_class.new }

      describe "#format" do
        subject { formatter.format(messages, nil, nil) }

        let(:line) { double(new_lineno: 1, commit_sha: nil) }
        let(:message) { Message.new("path/to", line, :warning, "crucial") }
        let(:messages) { [message] }
        let(:runner) { "Pronto::SomeRunner" }

        it do
          should ==
            '[{"message":"crucial","level":"warning","file":"path/to","line":{"start":1,"end":1}}]'
        end

        context "message without path" do
          let(:message) { Message.new(nil, line, :warning, "careful") }

          it do
            should == '[{"message":"careful","level":"warning","line":{"start":1,"end":1}}]'
          end
        end

        context "message without line" do
          let(:message) { Message.new("path/to", nil, :warning, "careful") }

          it do
            should == '[{"message":"careful","level":"warning","file":"path/to"}]'
          end
        end

        context "message with a runner" do
          let(:message) { Message.new(nil, line, :warning, "careful", nil, runner) }
          let(:messages) { [message] }

          it do
            should ==
              '[{"message":"careful","level":"warning","line":{"start":1,"end":1},"title":"Pronto::SomeRunner"}]'
          end
        end
      end
    end
  end
end

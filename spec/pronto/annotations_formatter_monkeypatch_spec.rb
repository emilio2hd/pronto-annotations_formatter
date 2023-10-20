# frozen_string_literal: true

describe Pronto::AnnotationsFormatterMonkeypatch do
  subject { described_class }

  before do
    Pronto::Formatter.send(:remove_const, :FORMATTERS)
    Pronto::Formatter.const_set(
      :FORMATTERS,
      Pronto::AnnotationsFormatterMonkeypatch::ORIGINAL_FORMATTERS
    )
  end

  describe ".apply_patch" do
    it "include the new annotations option to pronto formatter const" do
      expect(Pronto::Formatter::FORMATTERS.keys)
        .not_to include(Pronto::AnnotationsFormatterMonkeypatch::ANNOTATION_OPTION)

      Pronto::AnnotationsFormatterMonkeypatch.apply_patch

      expect(Pronto::Formatter::FORMATTERS.keys)
        .to include(Pronto::AnnotationsFormatterMonkeypatch::ANNOTATION_OPTION)
    end
  end
end

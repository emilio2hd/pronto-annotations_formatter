# Changelog

## 0.1.0

This initial version uses a monkeypatch to change `FORMATTERS` const, adding the new formatter.
Also, keeps compatibility with pronto versions prior to 0.11.2.

### New features

- Create AnnotationsFormatter class and change FORMATTERS const to include the new format

## 0.2.0

### Changes

- Use the new `registry` method to include annotations formatter and remove the monkeypatch

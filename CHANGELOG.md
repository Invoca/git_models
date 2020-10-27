# CHANGELOG for `git_models`

Inspired by [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

Note: this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.1] - 2020-07-27
### Changed
- Replace `hobo_fields` with `declare_schema`.
- Update :text/:string in schemas.

## [1.2.0] - 2020-07-13
### Added
- Add support for Rails 5 and 6.
- Add Appraisal and Jenkinsfile to test Rails 4, 5, 6.

### Changed
- Modernize gemspec and Gemfile some more.
- Allow Activesupport > 4.

## [1.1.1] - 2020-06-23
### Changed
- Allow Rails '~> 4.2'.
- Clean up gemspec and Gemfile; bundle update.
- Add magic frozen_string_literal: true comment everywhere.
- Get rubocop running again.
- Clean up Rakefile.

[1.3.1]: https://github.com/Invoca/git_models/compare/v1.2.0...v1.3.1
[1.2.0]: https://github.com/Invoca/git_models/compare/v1.1.1...v1.2.0
[1.1.1]: https://github.com/Invoca/git_models/compare/v1.1.0...v1.1.1

# frozen_string_literal: true

require_relative 'lib/slack_builder/version'

Gem::Specification.new do |spec|
  spec.name = 'slack_builder'
  spec.version = SlackBuilder::VERSION
  spec.required_ruby_version = '>= 3.0.0'

  spec.authors = ['cyb-']
  spec.email = ['gchateau@student.42.fr']

  spec.summary = 'Slack API payload builder DSL'
  spec.description = 'Slack API builder to easily build blocks message payloads with a comfortable DSL'
  spec.homepage = 'https://github.com/cyb-/slack-builder'
  spec.license = 'MIT'

  spec.metadata = {
    'bug_tracker_uri'       => 'https://github.com/cyb-/slack-builder/issues',
    'changelog_uri'         => 'https://github.com/cyb-/slack-builder/blob/main/CHANGELOG.md',
    'documentation_uri'     => 'https://github.com/cyb-/slack-builder/blob/main/README.md',
    'github_repo'           => 'ssh://github.com/cyb-/slack-builder',
    'homepage_uri'          => spec.homepage,
    'source_code_uri'       => 'https://github.com/cyb-/slack-builder',
    'rubygems_mfa_required' => 'true',
  }

  ignored = Regexp.union(
    /\A\.circleci/,
    /\A\.git/,
    /\A\.rubocop/,
    /\A\.rspec/,
    /\Abin/,
    /\Aspec/,
    /\AGemfile/,
    /\ARakefile/
  )
  spec.files = `git ls-files`.split("\n").grep_v(ignored)
  spec.require_paths = ['lib']
end

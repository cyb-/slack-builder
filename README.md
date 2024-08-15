# SlackBuilder

[![Gem Version](https://badge.fury.io/rb/slack_builder.svg)](https://badge.fury.io/rb/slack_builder)
[![CircleCI](https://circleci.com/gh/cyb-/beta-app/tree/main.svg?style=shield&circle-token=a8ff610f989095686162e979db5babf49f34539b)](https://circleci.com/gh/cyb-/slack-builder/?branch=main)

This gem aims to help generating [Slack](https://slack.com/) message payloads using [Block-kit API](https://api.slack.com/reference/block-kit/blocks) with kind of comfortable Ruby DSL focused on readability ¯\\_(ツ)_/¯

### Available blocks

|     | Block type                                                                | Available fields                                  |
|-----|---------------------------------------------------------------------------|---------------------------------------------------|
| ✅   | [`actions`](https://api.slack.com/reference/block-kit/blocks#actions)     | `elements`                                        |
| ✅   | [`context`](https://api.slack.com/reference/block-kit/blocks#context)     | `elements`                                        |
| ✅   | [`divider`](https://api.slack.com/reference/block-kit/blocks#divider)     | *N/A*                                             |
| ❌   | [`file`](https://api.slack.com/reference/block-kit/blocks#file)           |                                                   |
| ✅   | [`header`](https://api.slack.com/reference/block-kit/blocks#header)       | `text`                                            |
| 🏗️ | [`image`](https://api.slack.com/reference/block-kit/blocks#image)         | `image_url`, `alt_text`, `title`                  |
| ❌   | [`input`](https://api.slack.com/reference/block-kit/blocks#input)         |                                                   |
| ✅   | [`rich_text`](https://api.slack.com/reference/block-kit/blocks#rich_text) | `elements`                                        |
| ✅   | [`section`](https://api.slack.com/reference/block-kit/blocks#section)     | `text`, `fields`, `accessory`                     |                   
| 🏗  | [`video`](https://api.slack.com/reference/block-kit/blocks#video)         | `video_url`, `thumbnail_url`, `alt_text`, `title` | 

### Rich Text blocks

|   | Block type                                                                                          | Available fields                        |
|---|-----------------------------------------------------------------------------------------------------|-----------------------------------------|
| ✅ | [`rich_text_section`](https://api.slack.com/reference/block-kit/blocks#rich_text_section)           | `elements`                              |
| ✅ | [`rich_text_preformatted`](https://api.slack.com/reference/block-kit/blocks#rich_text_preformatted) | `elements`                              |
| ✅ | [`rich_text_quote`](https://api.slack.com/reference/block-kit/blocks#rich_text_quote)               | `elements`                              |
| ✅ | [`rich_text_list`](https://api.slack.com/reference/block-kit/blocks#rich_text_list)                 | `elements`, `style`, `indent`, `offset` |

### Rich Text elements

|   | Block type                                                                              | Available fields                         |
|---|-----------------------------------------------------------------------------------------|------------------------------------------|
| ✅ | [`broadcast`](https://api.slack.com/reference/block-kit/blocks#broadcast-element-type)  | `range`                                  |
| ✅ | [`channel`](https://api.slack.com/reference/block-kit/blocks#channel-element-type)      | `channel_id`, `style`                    |
| ✅ | [`color`](https://api.slack.com/reference/block-kit/blocks#color-element-type)          | `value`                                  |
| ✅ | [`date`](https://api.slack.com/reference/block-kit/blocks#date-element-type)            | `timestamp`, `format`, `url`, `fallback` |
| ✅ | [`emoji`](https://api.slack.com/reference/block-kit/blocks#emoji-element-type)          | `name`                                   |
| ✅ | [`link`](https://api.slack.com/reference/block-kit/blocks#link-element-type)            | `text`, `url`, `unsafe`, `style`         |
| ✅ | [`text`](https://api.slack.com/reference/block-kit/blocks#text-element-type)            | `text`, `style`                          |
| ✅ | [`user`](https://api.slack.com/reference/block-kit/blocks#user-element-type)            | `user_id`, `style`                       |
| ✅ | [`usergroup`](https://api.slack.com/reference/block-kit/blocks#user-group-element-type) | `usergroup_id`, `style`                  |

### Interactive elements

|    | Block type                                                                  | Available fields                                           |
|----|-----------------------------------------------------------------------------|------------------------------------------------------------|
| 🏗 | [`button`](https://api.slack.com/reference/block-kit/block-elements#button) | `text`, `url`, `action_id`, `style`, `accessibility_label` |


## Installation

```ruby
gem 'slack_builder', '~> 0.1.0', require: false
```


## Usage

Please refer to the **Slack API Block-kit** [documentation](https://api.slack.com/reference/block-kit/blocks) for available blocks and options.

```ruby
require 'slack_builder'

SlackBuilder.message do
  header 'Hello world :wave:'
  divider
  context do
    mrkdwn '*`Hello`* <https://example.com|world> :wave:'
  end
  image 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif', alt_text: 'Foo', title: 'Blob :ok_hand:', emoji: false
  divider
  section '*`Hello`* <https://example.com|world> :wave:' do
    mrkdwn '*Priority*'
    mrkdwn '*Critical*'
    plain_text 'High :collision:'
    plain_text '¯\\_(ツ)_/¯', emoji: false
    accessory do
      image 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif', alt_text: 'Bar'
    end
  end
  video 'https://www.youtube.com/watch?v=PdaAHMztNVE', thumbnail_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif', alt_text: 'Foo', title: 'Bar :collision:'
  divider
  rich_text do
    section do
      text 'Hello', bold: true, code: true
      link 'world', url: 'https://example.com'
      emoji :wave
    end
    quote do
      text 'Woopsie'
      broadcast :channel
      color '#666'
    end
    list :bullet do
      section do
        usergroup SLACK_USERGROUP_ID, client_highlight: true, highlight: true, italic: true
      end
      section do
        channel SLACK_CHANNEL_ID, client_highlight: true, bold: true, strike: true
        date 42, format: '{day_divider_pretty}', url: 'https://example.com'
      end
    end
    list :ordered, indent: 1 do
      section do
        text 'Hello'
      end
      section do
        text 'world'
      end
    end
    list :bullet do
      section do
        emoji :wave
      end
    end
    preformatted do
      text 'Hello', italic: true
      user SLACK_USER_ID, unlink: true, highlight: true, bold: true
    end
  end
  divider
  actions do
    button 'Click me :bomb:', url: 'https://github.com/cyb-/slack-builder', style: :danger
  end
end
```

You can also optionally add [secondary attachments](https://api.slack.com/reference/messaging/attachments) to your message, with an optional color

```ruby
require 'slack_builder'

SlackBuilder.message do
  header 'Hello world :wave:'
  
  attachment color: '#666' do
    rich_text do
      section do
        text 'Woopsie'
        emoji :grimacing
      end
    end
  end
end
```

Or with a text

```ruby
require 'slack_builder'

SlackBuilder.message '*`Hello`* <https://example.com|world> :wave:' do
  header 'Hello world :wave:'
  
  attachment do
    rich_text do
      section do
        emoji :bomb
      end
    end
  end
end
```

### Sending message

> [!NOTE]
> Gem has no dependencies, it's up to you to send the message however you want ¯\\_(ツ)_/¯

#### Example using [Slack client](https://github.com/slack-ruby/slack-ruby-client)
```ruby
require 'slack_builder'

payload = SlackBuilder.message do
  # ...
end
  
client = Slack::Web::Client.new
client.chat_postMessage(channel: '#somewhere', as_user: true, **payload)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cyb-/slack-builder/issues.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

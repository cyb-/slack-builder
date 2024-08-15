# frozen_string_literal: true

RSpec.shared_context 'with all blocks' do
  let(:blocks) do
    proc do
      header 'Hello world :wave:'
      divider
      # rubocop:disable RSpec/EmptyExampleGroup, RSpec/MissingExampleGroupArgument, RSpec/EmptyLineAfterExampleGroup
      context do
        mrkdwn '*`Hello`* <https://example.com|world> :wave:'
        image 'https://via.placeholder.com/100x100', alt_text: 'Blob'
        mrkdwn '*`Hello`* <https://example.com|world> :wave:', verbatim: true
      end
      # rubocop:enable RSpec/EmptyExampleGroup, RSpec/MissingExampleGroupArgument, RSpec/EmptyLineAfterExampleGroup
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
      video 'https://www.youtube.com/watch?v=PdaAHMztNVE', thumbnail_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif', alt_text: 'Foo', title: 'Bar :ok_hand:'
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
            usergroup 'SLACK_USERGROUP_ID', client_highlight: true, highlight: true, italic: true
          end
          section do
            channel 'SLACK_CHANNEL_ID', client_highlight: true, bold: true, strike: true
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
            emoji :trollface
          end
        end
        preformatted do
          text 'Hello', italic: true
          user 'SLACK_USER_ID', unlink: true, highlight: true, bold: true
        end
      end
      divider
      actions do
        button 'Click me :bomb:', url: 'https://github.com/cyb-/slack-builder', style: :danger
      end
    end
  end

  let(:expected_blocks) do
    [
      {
        type: 'header',
        text: {
          type: 'plain_text',
          text: 'Hello world :wave:',
          emoji: true,
        },
      },
      { type: 'divider' },
      {
        type: 'context',
        elements: [
          {
            type: 'mrkdwn',
            text: '*`Hello`* <https://example.com|world> :wave:',
            verbatim: false,
          },
          {
            type: 'image',
            image_url: 'https://via.placeholder.com/100x100',
            alt_text: 'Blob',
          },
          {
            type: 'mrkdwn',
            text: '*`Hello`* <https://example.com|world> :wave:',
            verbatim: true,
          },
        ],
      },
      {
        type: 'image',
        image_url: 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif',
        alt_text: 'Foo',
        title: {
          type: 'plain_text',
          text: 'Blob :ok_hand:',
          emoji: false,
        },
      },
      { type: 'divider' },
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: '*`Hello`* <https://example.com|world> :wave:',
          verbatim: false,
        },
        fields: [
          {
            type: 'mrkdwn',
            text: '*Priority*',
            verbatim: false,
          },
          {
            type: 'mrkdwn',
            text: '*Critical*',
            verbatim: false,
          },
          {
            type: 'plain_text',
            text: 'High :collision:',
            emoji: true,
          },
          {
            type: 'plain_text',
            text: '¯\\_(ツ)_/¯',
            emoji: false,
          },
        ],
        accessory: {
          type: 'image',
          image_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif',
          alt_text: 'Bar',
        },
      },
      {
        type: 'video',
        video_url: 'https://www.youtube.com/watch?v=PdaAHMztNVE',
        thumbnail_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif',
        alt_text: 'Foo',
        title: {
          type: 'plain_text',
          text: 'Bar :ok_hand:',
          emoji: true,
        },
      },
      { type: 'divider' },
      {
        type: 'rich_text',
        elements: [
          {
            type: 'rich_text_section',
            elements: [
              {
                type: 'text',
                text: 'Hello',
                style: {
                  bold: true,
                  code: true,
                },
              },
              {
                type: 'link',
                text: 'world',
                url: 'https://example.com',
                unsafe: false,
              },
              {
                type: 'emoji',
                name: 'wave',
              },
            ],
          },
          {
            type: 'rich_text_quote',
            elements: [
              {
                type: 'text',
                text: 'Woopsie',
              },
              {
                type: 'broadcast',
                range: 'channel',
              },
              {
                type: 'color',
                value: '#666',
              },
            ],
          },
          {
            type: 'rich_text_list',
            style: 'bullet',
            elements: [
              {
                type: 'rich_text_section',
                elements: [
                  {
                    type: 'usergroup',
                    usergroup_id: 'SLACK_USERGROUP_ID',
                    style: {
                      italic: true,
                      highlight: true,
                      client_highlight: true,
                    },
                  },
                ],
              },
              {
                type: 'rich_text_section',
                elements: [
                  {
                    type: 'channel',
                    channel_id: 'SLACK_CHANNEL_ID',
                    style: {
                      bold: true,
                      strike: true,
                      client_highlight: true,
                    },
                  },
                  {
                    type: 'date',
                    timestamp: 42,
                    format: '{day_divider_pretty}',
                    url: 'https://example.com',
                  },
                ],
              },
            ],
          },
          {
            type: 'rich_text_list',
            style: 'ordered',
            indent: 1,
            elements: [
              {
                type: 'rich_text_section',
                elements: [
                  {
                    type: 'text',
                    text: 'Hello',
                  },
                ],
              },
              {
                type: 'rich_text_section',
                elements: [
                  {
                    type: 'text',
                    text: 'world',
                  },
                ],
              },
            ],
          },
          {
            type: 'rich_text_list',
            style: 'bullet',
            elements: [
              {
                type: 'rich_text_section',
                elements: [
                  {
                    type: 'emoji',
                    name: 'trollface',
                  },
                ],
              },
            ],
          },
          {
            type: 'rich_text_preformatted',
            elements: [
              {
                type: 'text',
                text: 'Hello',
                style: {
                  italic: true,
                },
              },
              {
                type: 'user',
                user_id: 'SLACK_USER_ID',
                style: {
                  bold: true,
                  highlight: true,
                  unlink: true,
                },
              },
            ],
          },
        ],
      },
      { type: 'divider' },
      {
        type: 'actions',
        elements: [
          {
            type: 'button',
            text: {
              type: 'plain_text',
              text: 'Click me :bomb:',
              emoji: true,
            },
            url: 'https://github.com/cyb-/slack-builder',
            style: 'danger',
          },
        ],
      },
    ]
  end
end

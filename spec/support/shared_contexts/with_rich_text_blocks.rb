# frozen_string_literal: true

RSpec.shared_context 'with rich_text blocks' do
  let(:blocks) do
    proc do
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
  end

  let(:expected_blocks) do
    [
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
    ]
  end
end

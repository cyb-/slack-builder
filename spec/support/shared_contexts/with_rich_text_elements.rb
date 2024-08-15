# frozen_string_literal: true

RSpec.shared_context 'with rich_text elements' do
  let(:blocks) do
    proc do
      text 'Hello', bold: true, code: true
      link 'world', url: 'https://example.com'
      emoji :wave
      broadcast :channel
      color '#666'
      user 'SLACK_USER_ID', unlink: true, highlight: true, bold: true
      usergroup 'SLACK_USERGROUP_ID', client_highlight: true, highlight: true, italic: true
      channel 'SLACK_CHANNEL_ID', client_highlight: true, bold: true, strike: true
      date 42, format: '{day_divider_pretty}', url: 'https://example.com'
    end
  end

  let(:expected_blocks) do
    [
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
      {
        type: 'broadcast',
        range: 'channel',
      },
      {
        type: 'color',
        value: '#666',
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
      {
        type: 'usergroup',
        usergroup_id: 'SLACK_USERGROUP_ID',
        style: {
          client_highlight: true,
          highlight: true,
          italic: true,
        },
      },
      {
        type: 'channel',
        channel_id: 'SLACK_CHANNEL_ID',
        style: {
          bold: true,
          client_highlight: true,
          strike: true,
        },
      },
      {
        type: 'date',
        timestamp: 42,
        format: '{day_divider_pretty}',
        url: 'https://example.com',
      },
    ]
  end
end

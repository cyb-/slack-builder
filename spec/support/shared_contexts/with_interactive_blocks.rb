# frozen_string_literal: true

RSpec.shared_context 'with interactive blocks' do
  let(:blocks) do
    proc do
      button 'Hello world', url: 'https://example.com'
    end
  end

  let(:expected_blocks) do
    [
      {
        type: 'button',
        text: {
          type: 'plain_text',
          text: 'Hello world',
          emoji: true,
        },
        url: 'https://example.com',
      },
    ]
  end
end

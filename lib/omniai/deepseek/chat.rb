# frozen_string_literal: true

module OmniAI
  module DeepSeek
    # An DeepSeek chat implementation.
    #
    # Usage:
    #
    #   completion = OmniAI::DeepSeek::Chat.process!(client: client) do |prompt|
    #     prompt.system('You are an expert in the field of AI.')
    #     prompt.user('What are the biggest risks of AI?')
    #   end
    #   completion.choice.message.content # '...'
    class Chat < OmniAI::Chat
      JSON_RESPONSE_FORMAT = { type: "json_object" }.freeze

      module Model
        CHAT = "deepseek-chat"
        REASONER = "deepseek-reasoner"
      end

      DEFAULT_MODEL = Model::CHAT

    protected

      # @return [Hash]
      def payload
        OmniAI::DeepSeek.config.chat_options.merge({
          messages: @prompt.serialize,
          model: @model,
          stream: stream? || nil,
          temperature: @temperature,
          response_format: (JSON_RESPONSE_FORMAT if @format.eql?(:json)),
          tools: (@tools.map(&:serialize) if @tools&.any?),
        }).compact
      end

      # @return [String]
      def path
        "/chat/completions"
      end
    end
  end
end

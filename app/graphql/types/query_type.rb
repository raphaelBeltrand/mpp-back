module Types
  class QueryType < Types::BaseObject
    field :myself, UserType, null: true do
      description "return logged user if any"
    end

    def myself
      context[:current_user]
    end
  end
end

#     field :messages, [MessageType], null: false do
#       description "List messages"
#       argument :chat_id, ID, required: false
#       argument :offset, Integer, required: true
#       argument :limit, Integer, required: true
#     end

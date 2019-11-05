module Types
  class QueryType < Types::BaseObject
    ###
    ### USERS

    field :myself, UserType, null: true do
      description "return logged user if any"
    end

    def myself
      context[:current_user]
    end

    ###
    ### POLITICIANS

    field :politician, PoliticianType, null: true do
      description "return politician from id"

      argument :id, ID, required: true
    end

    def politician(args)
      Politician.find(args[:id])
    end

    field :politicians, [PoliticianType], null: false do
      description "return all or searched politicians"

      argument :name, String, required: false
    end

    def politicians(args)
      Politician.where("unaccent(politicians.name) @@ unaccent(?)", "%#{args[:name]}%")
    end

    ###
    ### GROUPS

    field :group, GroupType, null: true do
      description "return group from id"

      argument :id, ID, required: true
    end

    def group(args)
      Group.find(args[:id])
    end

    field :groups, [GroupType], null: false do
      description "return public groups"
    end

    def groups
      Group.where(public: true)
    end
  end
end

#     field :messages, [MessageType], null: false do
#       description "List messages"
#       argument :chat_id, ID, required: false
#       argument :offset, Integer, required: true
#       argument :limit, Integer, required: true
#     end

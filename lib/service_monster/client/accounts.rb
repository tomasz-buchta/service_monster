module ServiceMonster
  class Client
    module Accounts

      def accounts(options = {})
        response = get("accounts", options)
      end

      def account(id, options = {})
        response = get("accounts/#{id}", options)
      end

    end
  end
end
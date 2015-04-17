module ServiceMonster
  class Client
    module Orders

      def orders(options = {})
        response = get("orders", options)
      end

      def order(id, options = {})
        response = get("orders/#{id}", options)
      end

    end
  end
end
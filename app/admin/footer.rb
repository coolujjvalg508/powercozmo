module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"
        super :style => "text-align: left;font-size:15px;"

        div do
          para "&#169; Power Cozmo #{Date.today.year}".html_safe
        end
      end

    end
  end
end

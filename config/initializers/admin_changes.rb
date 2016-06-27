module ActiveAdmin
  module Inputs
    module Filters
      class DateRangeInput < ::Formtastic::Inputs::StringInput
        def lt_input_name
          "#{method}_lteqdate"
        end
      end
    end
  end
end

Ransack.configure do |config|
  # config.add_predicate 'lteqdate',
  #   arel_predicate: 'lteq',
  #   formatter: -> (v) { v.strftime '%Y-%m-%d 23:59:59.9999' }
  config.add_predicate 'lteqdate',
  arel_predicate: 'lt',
  formatter: -> (v) { v + 1.day }
end
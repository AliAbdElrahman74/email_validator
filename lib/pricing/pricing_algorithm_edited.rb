module Pricing
  class PriceCalculator

    def initialize(ranges_values, price_ranges, high, low)
      @ranges_values = ranges_values
      @price_ranges = price_ranges
      @high = high
      @low = low
      @ranges_values ||=  {:_15 => 0.75,:_25 => 0.775,:_50 => 0.8,:_75 => 0.825,
        :_100 => 0.85,:_200 => 0.875,:_400 => 0.9,:_600 => 0.925,:other => 0.95
      }
      @price_ranges ||=  [15, 25, 50, 75, 100, 200, 400, 600]
    end

    def brand_original_price(brand, price_reference, product_database)
      if brand.rating = @high
        price_suggestion = get_price_suggestion(price_reference, product_database, 1.1)
      elsif brand.rating = @low
        price_suggestion = get_price_suggestion(price_reference, product_database, 0.9)
      else
        price_suggestion = get_price_suggestion(price_reference, product_database, 1)
      end
      price_suggestion
    end

    private

    def get_price_suggestion(price_reference, product_database, multiplied_value)
      @price_ranges.each do |price_range|
        if price_reference < price_range
          return calculate_price_suggestion(price_reference, product_database,
            @ranges_values[int_to_sym(condition_value)]), multiplied_value)
          end
        end
      return calculate_price_suggestion(price_reference, product_database, @ranges_values[:other], multiplied_value)
    end

    def calculate_price_suggestion(price_reference, product_database, percentage, multiplied_value)
      (price_reference - product_database.shipping_cost * percentage) * multiplied_value
    end

    def int_to_sym(num)
      ("_" + num.to_s).to_sym
    end
  end
end

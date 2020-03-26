class TaxBracket
    attr_accessor :lower_limit, :upper_limit, :rate, :is_inclusive

    @lower_limit
    @upper_limit
    @rate
    @is_inclusive

    def initialize(lower_limit, upper_limit, rate, is_inclusive)
        @lower_limit = lower_limit
        @upper_limit = upper_limit
        @rate = rate
        @is_inclusive = is_inclusive
    end
end
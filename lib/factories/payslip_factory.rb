require_relative '../payslip/monthly_payslip'
require_relative '../payslip/payslip'

class PayslipFactory
    TYPES = {
        monthly: MonthlyPayslip
    }

    def self.for(type)
        tax_brackets = [
        TaxBracket.new(0, 20000, 0.0, 1),
        TaxBracket.new(20001, 40000, 0.1, 0),
        TaxBracket.new(40001, 80000, 0.2, 0),
        TaxBracket.new(80001, 180000, 0.3, 0),
        TaxBracket.new(180001, 1 << 64, 0.4, 0)
        ]

        (TYPES[type] || MonthlyPayslip).new(tax_brackets)
    end
end
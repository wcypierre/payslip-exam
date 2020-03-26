require_relative '../payslip/outputter/monthly_payslip_outputter'

class PayslipOutputterFactory
    TYPES = {
        monthly: MonthlyPayslipOutputter
    }

    def self.for(type, payslip)
        (TYPES[type] || MonthlyPayslipOutputter).new(payslip)
    end
end
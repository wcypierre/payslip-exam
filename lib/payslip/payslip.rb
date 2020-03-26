require_relative '../data_model/tax_bracket'

module Payslip
  def generate_payslip()
    raise "Not implemented"
  end

  private def calculate_gross_income
    raise "Not implemented"
  end

  private def calculate_income_tax
    raise "Not implemented"
  end

  private def calculate_net_income
    raise "Not implemented"
  end
end

class MonthlyPayslipOutputter
  def initialize(monthly_payslip)
    @monthly_payslip = monthly_payslip
  end

  def to_string()
    return %{Monthly Payslip for: #{@monthly_payslip.staff_name}
    Gross Monthly Income: $#{@monthly_payslip.monthly_gross_income}
    Monthly Income Tax: $#{@monthly_payslip.monthly_income_tax}
    Net Monthly Income: $#{@monthly_payslip.monthly_net_income}}
  end
end



class PayslipOutputterFactory
  TYPES = {
    monthly: MonthlyPayslipOutputter
  }

  def self.for(type, payslip)
    (TYPES[type] || MonthlyPayslipOutputter).new(payslip)
  end
end
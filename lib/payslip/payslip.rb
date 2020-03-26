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
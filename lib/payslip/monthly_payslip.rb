require_relative './payslip'

class MonthlyPayslip
  include Payslip

  attr_accessor :staff_name, :annual_income, :monthly_gross_income, :monthly_income_tax, 
  :monthly_net_income

  @staff_name
  @annual_income
  @monthly_gross_income
  @monthly_income_tax
  @monthly_net_income
  @tax_brackets
  MONTHS_IN_ONE_YEAR = 12

  def initialize(tax_brackets)    
    @tax_brackets = tax_brackets
  end

  def generate_payslip(staff_name, annual_income)
    @staff_name = staff_name
    @annual_income = annual_income

    calculate_gross_income()
    calculate_income_tax()
    calculate_net_income()

    return self
  end

  private def calculate_gross_income
    @monthly_gross_income = @annual_income / MONTHS_IN_ONE_YEAR
  end

  private def calculate_income_tax
    temp_annual_income = @annual_income
    annual_income_tax = 0

    @tax_brackets.each do |tax_bracket|
      tax_range = tax_bracket.upper_limit - tax_bracket.lower_limit

      if tax_bracket.is_inclusive == 0
        tax_range += 1
      end

      if temp_annual_income > 0
        if (tax_range) % temp_annual_income == tax_range
          annual_income_tax += (tax_range * tax_bracket.rate).round(2)
        else
          annual_income_tax += (temp_annual_income * tax_bracket.rate).round(2)
        end
        
        temp_annual_income -= tax_range
      end
    end 
    
    @monthly_income_tax = annual_income_tax / MONTHS_IN_ONE_YEAR
    @monthly_income_tax = @monthly_income_tax.round(2)
  end

  private def calculate_net_income
    @monthly_net_income = @monthly_gross_income - @monthly_income_tax
  end
end
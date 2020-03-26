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
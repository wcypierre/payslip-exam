require_relative '../../lib/factories/payslip_factory'
require_relative '../../lib/factories/payslip_outputter_factory'
require_relative '../../lib/payslip/monthly_payslip'
require_relative '../../lib/payslip/payslip'
require_relative '../../lib/payslip/outputter/monthly_payslip_outputter'

require 'bigdecimal'

describe Payslip do
    describe "Payslip" do
        it "Check Annual Income is 60000" do
            payslip = PayslipFactory.for('monthly').generate_payslip("Ren", 60000)
            expect(payslip.annual_income).to eq 60000
        end

        it "Monthly Income Tax is 500" do
            payslip = PayslipFactory.for('monthly').generate_payslip("Ren", 60000)
            expect(payslip.monthly_income_tax).to eq 500
        end

        it "Monthly Payslip Output is correct" do
            output = %{Monthly Payslip for: Ren\n        Gross Monthly Income: $5000\n        Monthly Income Tax: $500.0\n        Net Monthly Income: $4500.0}
            
            payslip = PayslipFactory.for('monthly').generate_payslip("Ren", 60000)
            payslip_outputter = PayslipOutputterFactory.for('monthly', payslip)
            expect(payslip_outputter.to_string()).to eq output
        end
    end
end
require_relative '../../lib/payslip/payslip'

describe Payslip do
    describe "Payslip" do
        it "Check Annual Income is 60000" do
            payslip = PayslipFactory.for('monthly').generate_payslip("Ren", 60000)
            expect(payslip.annual_income).to eq 60000
        end

        # it "Monthly Income Tax is 500" do
        #     payslip = PayslipFactory.for('monthly').generate_payslip("Ren", 60000)
        #     expect(payslip.monthly_income_tax).to eq 6000
        # end
    end
end
class SalaryCalculator
  def self.calculate(employee)
    gross = employee.salary.to_f

    deduction =
      case employee.country
      when "India" then gross * 0.10
      when "United States" then gross * 0.12
      else 0
      end

    {
      gross: gross,
      deduction: deduction,
      net: gross - deduction
    }
  end
end

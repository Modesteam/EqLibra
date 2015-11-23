class DirectTreasury < ActiveRecord::Base
	belongs_to :wallet

	def business_days_between(start_date, end_date)
	  days_between = (end_date - start_date).to_i
	  return 0 unless days_between > 0

	  whole_weeks, extra_days = days_between.divmod(7)

	  unless extra_days.zero?
	    tomorrow_start = start_date+1
	    extra_days -= if tomorrow_start.wday <= end_date.wday
	                    [tomorrow_start.sunday?, end_date.saturday?].count(true)
	                  else
	                    2
	                  end
	  end
	  (whole_weeks * 5) + extra_days
	end

	def calendar_days(start_date, end_date)
	  calendar_days = (end_date - start_date - 1).to_i
	end

	def gross_value(start_date, end_date)
		total_working_days = business_days_between(start_date, end_date)
		business_year = 252.0
		exponential = total_working_days/business_year
		aux = (1 + (self[:acquisitionsTax])/100) ** exponential

		gross_value_real = self[:investment_value] * aux
		return format("%.2f", gross_value_real).to_f
	end

	def gross_income(start_date, end_date)
		gross_value_calculation = gross_value(start_date, end_date)
		gross_income = (gross_value_calculation / self[:investment_value] - 1) * 100
		return format("%.2f", gross_income).to_f
	end

	def ir_tax(days)
	    raise InvalidNumberOfDays if days < 0
	    
	    if(0 <= days && days <= 180)
	    	0.25
	    elsif(181 <= days && days <= 361)
	    	0.20
	    elsif(362 <= days && days <= 720)
	    	0.175
	    elsif(days > 720)
	    	0.15
	  	end
	end

	def value_ir(start_date, end_date)
		calendar_days_ir = calendar_days(start_date, end_date)
		ir_tax_calculation = ir_tax(calendar_days_ir)
		gross_value_calculation = gross_value(start_date, end_date)

		value_ir = (gross_value_calculation - self[:investment_value]) * ir_tax_calculation
		return format("%.2f", value_ir).to_f
	end

	def liquid_value(start_date, end_date)
		gross_value_calculation = gross_value(start_date, end_date)
		value_ir_calculation = value_ir(start_date, end_date)
		liquid_value_calculation = gross_value_calculation - value_ir_calculation
		return format("%.2f", liquid_value_calculation).to_f
	end

	def liquid_income(start_date, end_date)
		liquid_value_calculation = liquid_value(start_date, end_date)
		liquid_income = (liquid_value_calculation / self[:investment_value] - 1) * 100
		return format("%.2f", liquid_income)
	end

end

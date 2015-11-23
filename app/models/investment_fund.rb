class InvestmentFund < ActiveRecord::Base
  belongs_to :wallet

  def share_value
    share_value = self[:capital]/self[:exitTax]
    return format("%.2f", share_value).to_f
  end

  def number_share
    number_share = self[:shareValue]/share_value
    return format("%.2f", number_share).to_f
  end

  def total_fund_share
    total_fund_share = self[:exitTax]+number_share
    return format("%.2f", total_fund_share).to_f
  end

  def net_worth
    net_worth = self[:capital]+self[:shareValue]
    return format("%.2f", net_worth).to_f
  end

  def dimension_values
    dimension_values = net_worth/total_fund_share
    return format("%.2f", dimension_values).to_f
  end

  def yield_percentage
    yield_percentage = dimension_values/share_value * self[:admTax]
    return yield_percentage
  end
  
end

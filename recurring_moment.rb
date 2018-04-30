require 'active_support'
require 'active_support/core_ext'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def advance(period)
    if period == 'daily'
      self.now + period.values.days
    elsif period == 'weekly'
      self.now + interval.weeks
    else period == 'monthly'
      self.now + interval.months
    end
  end

  def match(date)
    current = @start

    while current < date
      if current == date
        return true
      end

      if @period == 'monthly'
        current = current.advance(months: @interval)
      elsif @period = 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
    end

    return false
  end

end

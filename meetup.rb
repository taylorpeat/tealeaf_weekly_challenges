class Meetup
  FIRST_TEENTH = 13
  DAYS_OF_WEEK = %i(sunday monday tuesday wednesday thursday friday saturday)
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, section)
    first_day = section_offset(section)
    offset = Date.new(year, month).cwday + (first_day - 1) % 7
    offset -= 7 if offset > 6
    day = first_day + DAYS_OF_WEEK.index(weekday) - offset
    day += 7 if day < first_day
    Date.new(year, month, day)
  end

  def section_offset(section)
    case section
    when :first then 1
    when :second then 8 
    when :third then 15
    when :fourth then 22
    when :teenth then FIRST_TEENTH
    when :last
      days_in_month = Date.new(year, month).next_month.prev_day.day - 6
    end
  end

end
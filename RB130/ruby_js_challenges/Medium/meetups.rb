require 'date'

class Meetup
  DESC_VALS = { 'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5 }
  WEEKDAY_VALS = { 'sunday' => 0, 'monday' => 1, 'tuesday' => 2, 'wednesday' => 3,
                   'thursday' => 4, 'friday' => 5, 'saturday' => 6 }

  def initialize(year, month)
    @date = Date.new(year, month, 1)
  end

  def day(weekday, schedule)
    @weekday = weekday.downcase
    @schedule = schedule.downcase
    case schedule
    when 'teenth'
      find_teenth_day
    when 'last'
      find_last_day
    else
      find_xth_day
    end
  end

  private

  def find_xth_day
    count = 0
    date = nil
    for day in (@date...@date.next_month)
      count += 1 if day.wday == WEEKDAY_VALS[@weekday]
      if count == DESC_VALS[@schedule]
        date = day
        break
      end
    end
    date
  end

  def find_teenth_day
    date = nil
    for day in (Date.new(@date.year, @date.month, 13)..Date.new(@date.year, @date.month, 19))
      if day.wday == WEEKDAY_VALS[@weekday]
        date = day
        break
      end
    end
    day
  end

  def find_last_day
    date = nil
    for day in (@date.next_month.prev_day(7)..@date.next_month.prev_day)
      if day.wday == WEEKDAY_VALS[@weekday]
        date = day
        break
      end
    end
    date
  end
end

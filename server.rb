require 'rufus-scheduler'
require_relative 'check'

scheduler = Rufus::Scheduler.new

scheduler.every '2m', first: :now do
  Check.new('https://pokupon.ua/')
  Check.new('https://partner.pokupon.ua/')
end

scheduler.join
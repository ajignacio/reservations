module ApplicationHelper
  def number_format(num)
    number_to_currency(num,presence:2, :unit => "")
  end
end

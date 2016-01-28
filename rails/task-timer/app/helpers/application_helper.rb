module ApplicationHelper
  def get_season()
    time = Time.new


    if time.month >= 3 && time.month <= 5
      "It's Spring"
    elsif time.month >= 5 && time.month <= 8
      "Everyone loves Summer"
    elsif time.month > 8 && time.month <= 10
      "It's time to Fall"
    else
      "Brace yourself, it's already Winter"
    end
  end

  def get_random_value( max_value = 10 )
    rand(max_value)
  end

  def get_random_welcome ()
    opening = ["What a beautiful day.",
      "Welcome to our site.",
      "Thank you for stopping by."]
    middle = ["We hope you find what you need",
      "We have out our sale items",
      "Check out our sale items."]
    ending = ["What a beautiful day.",
      "Welcome to our site.",
      "Thank you for stopping by."]

    "#{opening[rand 3]} #{middle[rand 3]} #{ending[rand 3]}"
    
  end
end

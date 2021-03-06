# Склонятор + цвет фона профиля по умолчанию
module UsersHelper
  def right_spelling(number, one, two, many)
    return many if (11..14).include?(number % 100)
    return one if number % 10 == 1
    return two if (2..4).include?(number % 10)

    many
  end

  def background_color
    @user.style.nil? ? '#005a55' : @user.style
  end
end

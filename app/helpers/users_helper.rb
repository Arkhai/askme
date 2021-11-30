module UsersHelper
  def right_spelling(number)
    return 'вопросов' if (11..14).include?(number % 100)
    return 'вопрос' if number % 10 == 1
    return 'вопроса' if (2..4).include?(number % 10)
    'вопросов'
  end
end

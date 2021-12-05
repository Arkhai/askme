module UsersHelper
  def right_spelling(number, word)
    words = {
      'question': {one: 'вопрос', two: 'вопроса', many: 'вопросов'},
      'answer': {one: 'ответ', two: 'ответа', many: 'ответов'}
    }

    word = words[word.to_sym]

    return word[:many] if (11..14).include?(number % 100)
    return word[:one] if number % 10 == 1
    return word[:two] if (2..4).include?(number % 10)
    word[:many]
  end
end

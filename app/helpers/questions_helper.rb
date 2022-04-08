# Выводим автора вопроса, если он есть
module QuestionsHelper
  def author(author)
    if author.nil?
      'предпочёл остаться анонимным'
    else
      link_to author.username, user_path(author.id)
    end
  end
end

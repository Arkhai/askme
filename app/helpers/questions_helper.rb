module QuestionsHelper
  def author(author)
    if author.nil?
      return 'предпочёл остаться анонимным'
    else
      return link_to author.username, user_path(author.id)
    end
  end
end

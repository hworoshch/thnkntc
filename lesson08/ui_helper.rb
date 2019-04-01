module UiHelper
  def spacer
    puts "\n\n"
  end

  def hr
    puts "\n"
  end

  def header(title)
    spacer
    puts title
    hr
  end
end

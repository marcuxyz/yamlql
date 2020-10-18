REGEX_FOUND_COLON = /\s(\w+)\:(\d+)/

class Normalize
  def text(text)
    text = self.normalize_required(text)
    return self.normalize_colon(text)
  end

  private
  def normalize_required(text)
    if text.include? 'required'
      return text.sub! 'required', 'not null'
    end
    return text
  end

  def normalize_colon(text)
    unless text.include? ':' || text.match?(REGEX_FOUND_COLON)
      return text
    end
    return text.gsub(REGEX_FOUND_COLON, ' \1(\2)')
  end
end
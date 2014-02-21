module SanitizedAttributes
  def sanitize
    self.reject{|key, value| key.to_s == "funds"}
  end
end
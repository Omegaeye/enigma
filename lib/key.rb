class Key

  def initialize

  end

  def generate
    key = rand(0..99_999)
    if key.to_s.length < 5
      "%05d" % key
    else
      key
    end.to_s
  end



end

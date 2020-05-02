class Format
  def self.method_missing(name, args)
    "<#{name}>#{args}</#{name}>"
  end
end

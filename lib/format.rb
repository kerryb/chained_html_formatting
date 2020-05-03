class Format
  undef_method :p # p is a built-in method on Module

  def self.method_missing(name, *args)
    new.send name, *args
  end

  def initialize(tags = [])
    @tags = tags
  end

  def call(*args)
    __generate(@tags, args)
  end

  def method_missing(name, *args)
    if args.empty?
      Format.new(@tags << name)
    else
      __generate(@tags << name, args)
    end
  end

  private def __generate(tags, args)
    tags.reverse.reduce(args.join) {|acc, tag| "<#{tag}>#{acc}</#{tag}>" }
  end
end

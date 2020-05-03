class Format
  undef_method :p # p is a built-in method on Module

  def self.method_missing(name, *args)
    new.send name, *args
  end

  def initialize(tags = [])
    @tags = tags
  end

  def call(*args)
    @tags.reverse.reduce(args.join) {|acc, tag| "<#{tag}>#{acc}</#{tag}>" }
  end

  def method_missing(name, *args)
    formatter = Format.new(@tags + [name])
    args.empty? ? formatter : formatter.(*args)
  end
end

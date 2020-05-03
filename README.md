# Chained HTML Formatting

We want to create an object with methods for various HTML elements: `div`, `p`,
`span` and `h1` for the sake of this Kata.

These methods will wrap the passed-in string in the tag associated with each.

```ruby
Format.div("foo") #=> "<div>foo</div>"
Format.p("bar") #=> "<p>bar</p>"
Format.span("fiz") #=> "<span>fiz</span>"
Format.h1("buz") #=> "<h1>buz</h1>"
```

We also want to be able to add additional formatting by chaining our methods
together.

```ruby
Format.div.h1("FooBar")
#=> "<div><h1>FooBar</h1></div>"
Format.div.p.span("FizBuz")
#=> "<div><p><span>FizBuz</span></p></div>"
```

and so on, as deep as we care to use.

Multiple arguments should be concatenated and wrapped in the correct HTML
formatting.

```ruby
Format.div.h1("Foo", "Bar")
#=> "<div><h1>FooBar</h1></div>"
```

We should be able to store the created methods and reuse them.

```ruby
wrap_in_div = Format.div
wrap_in_div("Foo") #=> "<div>Foo</div>"
wrap_in_div.p("Bar") #=> "<div><p>Bar</p></div>"
wrap_in_div_h1 = Format.div.h1
wrap_in_div_h1("Far") #=> "<div><h1>Far</h1></div>"
wrap_in_div_h1.span("Bar") #=> "<div><h1><span>Bar</span></h1></div>"
```

And finally, we should be able to nest Format calls.

```ruby
Format.div(
  Format.h1("Title"),
  Format.p("Paragraph with a #{Format.span("span")}.")
  )
#=> "<div><h1>Title</h1><p>Paragraph with a <span>span</span>.</p></div>"
```

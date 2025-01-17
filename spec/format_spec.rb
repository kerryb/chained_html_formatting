require "format"

describe "Format" do
  it "can wrap text in a <div> tag" do
    expect(Format.div("foo")).to eq "<div>foo</div>"
  end

  it "can wrap text in a <p> tag" do
    expect(Format.p("foo")).to eq "<p>foo</p>"
  end

  it "can wrap text in a <span> tag" do
    expect(Format.span("foo")).to eq "<span>foo</span>"
  end

  it "can wrap text in a <h1> tag" do
    expect(Format.h1("foo")).to eq "<h1>foo</h1>"
  end

  it "allows tags to be chained" do
    expect(Format.div.h1("FooBar")).to eq "<div><h1>FooBar</h1></div>"
  end

  it "allows tags to be chained arbitrarily deep" do
    expect(Format.div.p.span("FizBuz")).to eq "<div><p><span>FizBuz</span></p></div>"
  end

  it "concatenates multiple arguments" do
    expect(Format.div.h1("Foo", "Bar")).to eq "<div><h1>FooBar</h1></div>"
  end

  it "allows formatters to be captured for later use" do
    wrap_in_div = Format.div
    # Note: Ruby doesn't have bare functions, so we have to call it using the .() syntax
    expect(wrap_in_div.("Foo")).to eq "<div>Foo</div>"
  end

  it "allows a chained formatter to be captured for later use" do
    wrap_in_div_h1 = Format.div.h1
    expect(wrap_in_div_h1.("Far")).to eq "<div><h1>Far</h1></div>"
  end

  it "allows more tags to be chained onto saved formatters" do
    wrap_in_div_h1 = Format.div.h1
    expect(wrap_in_div_h1.span("Bar")).to eq "<div><h1><span>Bar</span></h1></div>"
  end

  it "allows formatters to be nested" do
    expect(Format.div(
      Format.h1("Title"),
      Format.p("Paragraph with a #{Format.span("span")}.")
    )).to eq "<div><h1>Title</h1><p>Paragraph with a <span>span</span>.</p></div>"
  end
end

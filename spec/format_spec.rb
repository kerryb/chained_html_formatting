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
    expect(wrap_in_div.("Foo")).to eq "<div>Foo</div>"
  end
end

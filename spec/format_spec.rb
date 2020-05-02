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
end

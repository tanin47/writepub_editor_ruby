require 'spec_helper'

describe '<img>' do
  
  it "transforms <img> to <img />" do
    
    html = <<-HTML
      Test some text with img <img src="/uploads/temp/taylor_swift.jpg"><img src="/uploads/temp/taylor_swift.jpg">aaaaa
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s.strip
    new_html.should == 'Test some text with img <img src="/uploads/temp/taylor_swift.jpg" /><img src="/uploads/temp/taylor_swift.jpg" />aaaaa'
    
  end
  
  it "removes attributes from <img> except 'src'" do
    
    html = <<-HTML
      Test some text with img <img src="http://www.yahoo.com/google.jpg" style="width:100px;" alt="asdasd" />
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s.strip
    new_html.should == 'Test some text with img <img src="http://www.yahoo.com/google.jpg" />'

  end

  it "removes <img> that does not have 'src'" do
    
    html = <<-HTML
      Test some text with img <img style="width:100px;" alt="asdasd" />
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s.strip
    new_html.should == 'Test some text with img'

  end

  it "retrieves img's src in a correct order" do
    
    html = <<-HTML
      <img src="http://www.yahoo.com/google.jpg"/>
      <img src="http://www.yahoo.com/google1.jpg"/>
      <img src="http://www.yahoo.com/google2.jpg"/>
      <img src="http://www.yahoo.com/google3.jpg"/>
    HTML
    
    new_html = WritepubEditor::Base.new(html)
    new_html.get_images.should =~ ["http://www.yahoo.com/google.jpg",
                                    "http://www.yahoo.com/google1.jpg",
                                    "http://www.yahoo.com/google2.jpg",
                                    "http://www.yahoo.com/google3.jpg"
                                    ]

  end

  it "removes local domain name corectly" do

    html = <<-HTML
      <img src="http://www.google.com/google.jpg"/>
      <img src="https://www.google.com/google1.jpg"/>
      <img src="http://google.com/google2.jpg"/>
      <img src="https://google.com/google3.jpg"/>
    HTML
    
    doc = WritepubEditor::Base.new(html)
    doc.get_images.should =~ ["/google.jpg",
                                    "/google1.jpg",
                                    "/google2.jpg",
                                    "/google3.jpg"
                                    ]
                                    
    html = doc.to_s
    
    html.should match(/src="\/google\.jpg"/)
    html.should match(/src="\/google1\.jpg"/)
    html.should match(/src="\/google2\.jpg"/)
    html.should match(/src="\/google3\.jpg"/)
  end

end
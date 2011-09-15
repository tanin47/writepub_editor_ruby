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
      Test some text with img <img src="http://www.google.com/google.jpg" style="width:100px;" alt="asdasd" />
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s.strip
    new_html.should == 'Test some text with img <img src="http://www.google.com/google.jpg" />'

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
      <img src="http://www.google.com/google.jpg"/>
      <img src="http://www.google.com/google1.jpg"/>
      <img src="http://www.google.com/google2.jpg"/>
      <img src="http://www.google.com/google3.jpg"/>
    HTML
    
    new_html = WritepubEditor::Base.new(html)
    new_html.get_images.should =~ ["http://www.google.com/google.jpg",
                                    "http://www.google.com/google1.jpg",
                                    "http://www.google.com/google2.jpg",
                                    "http://www.google.com/google3.jpg"
                                    ]

  end

end
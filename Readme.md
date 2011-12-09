WritePub Editor Parser
=======================

An HTML parser that ensures the validity of HTML tags, according to WritePubEditor's rules.

* An unallowed tag will be removed and all of its children will be propagated to its parent (at the same position).
* If the html is malformed in any way, the malformed part will be removed

Allow tags
---------------------
* ```<b>```, ```<i>```, ```<strong>```, ```<em>``` with no attributes
* ```<span>``` must be accompanied with the attribute 'style', and 'style' can have either 'font-weight:.*' or 'font-style:italic'
* ```<img>``` must be accompanied with the attribute 'src'
* ```<br/>``` and <br> with no attributes
* ```<p>``` is allowed
* ```<iframe>``` from youtube is allowed

How to use it
--------------------

```ruby
html = <<-HTML
  Test some text with <a href="http://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
HTML

new_html = WritepubEditor::Base.new(html).to_s
```


How to help
---------------
1. Fork the project
2. ```bundle install``` to install all required gems
3. Run all tests with ```bundle exec rspec spec/*```
4. Add new features
5. Write tests for it
6. Send me a pull request

Author
---------------------
Tanin Na Nakorn

License
---------------------
Creative Commons 3.0
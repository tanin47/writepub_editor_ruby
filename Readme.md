WritePub Editor Parser
=======================

An HTML parser that ensures the validity of HTML tags, according to WritePubEditor's rules.

* An unallowed tag will be removed and all of its children will be propagated to its parent (at the same position).
* If the html is malformed in any way, an exception will be thrown (by Nokogiri)

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



Author
---------------------
Tanin Na Nakorn

License
---------------------
Creative Commons 3.0
require File.expand_path("../lib/writepub_editor", __FILE__)
puts WritepubEditor.enforce_rules_on(File.open("index.html","r").read)


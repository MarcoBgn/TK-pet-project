#initialization file 


APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT, "lib"))

require "tk_frame"

pass_store = PassStore.new
pass_store.launch!


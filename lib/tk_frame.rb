require "./lib/methods"
require 'tk'
require 'tkextlib/tile'

include Methods

class PassStore

def launch!

TkOption.add '*tearOff', 0

root = TkRoot.new {title "---- Pass Store ----"}
root["resizable"] = false, false
frame = Tk::Tile::Frame.new(root) {padding "30 30 30 30"; borderwidth 5; relief "solid"}.grid( :column => 3, :row => 3, :sticky => "ns")
button = Tk::Tile::Button.new(frame) { text "Quit"; command "quit_pressed"; width 12}.grid( :column => 3, :row => 3, :sticky => "nw")
button2 = Tk::Tile::Button.new(frame) { text "Search"; command "search"; width 12}.grid( :column =>1, :row => 3, :sticky => "nw")
label2 = Tk::Tile::Label.new(frame) {text " Search here"; font "Times"; borderwidth 3; relief "ridge"; width 12}.grid( :column =>1, :row => 1, :sticky => "nw")

#win = TkToplevel.new(root)
#menubar = TkMenu.new(win)
#win["menu"] = menubar

#add_pass = TkMenu.new(menubar)
#menubar.add :cascade, :menu => add_pass, :label => "Add"

button3 = Tk::Tile::Button.new(frame) { text "Add"; command "add_pressed"}.grid( :column => 3, :row => 1, :sticky => "nw")


$value = TkVariable.new; $result = TkVariable.new
input = Tk::Tile::Entry.new(frame) {width 9; textvariable $value}.grid( :column => 1, :row => 2, :sticky => "w")

res_label = Tk::Tile::Label.new(frame) {textvariable $result; width 14; borderwidth 2; relief "raised"}.grid(:column => 2, :row => 2, :sticky => "w")


TkWinfo.children(frame).each {|w| TkGrid.configure w, :ipadx => 8, :ipady => 8}


Tk.mainloop
end

end
module Methods
  
  $filepath = File.join(APP_ROOT, "LogInf.txt")
  create_file if !$filepath

def search  
  pair = []
  File.open("LogInf.txt", "r") do |line|
    line.pos = 0 
    while line.gets != nil
      pair << $_.split("\t")
    end  
  end
  #not efficient, used to practice
   search = $value.value.chomp.downcase.strip
   if pair[0][0].downcase.include?(search)
     $result.value = pair[0][1]
   elsif 
     pair[1][0].downcase.include?(search)
      $result.value = pair[1][1]
    elsif 
      pair[2][0].downcase.include?(search)
       $result.value = pair[2][1] 
    else
      $result.value = "No Match!"
    end
end


def quit_pressed
  exit!
end

def add_pressed
  @@add_win = TkToplevel.new {title "Add Entry"; padx 5; pady 5}
  @@add_win["geometry"] = "400x150+250+250"
  @@add_win["resizable"] = false, false
  label = Tk::Tile::Label.new(@@add_win) {text "Add User :"; width 12}.grid( :column => 1, :row => 2, :sticky => "we")
  label = Tk::Tile::Label.new(@@add_win) {text "Add Password :"; width 12}.grid( :column => 1, :row => 3, :sticky => "we")
  $newuser = TkVariable.new
  @@user_ent = Tk::Tile::Entry.new(@@add_win) {textvariable $newuser}.grid( :column => 2, :row => 2, :sticky => "we")
  $newpass = TkVariable.new
  pass_ent = Tk::Tile::Entry.new(@@add_win) {textvariable $newpass}.grid( :column => 2, :row => 3, :sticky => "we")
  button1 = Tk::Tile::Button.new(@@add_win) {text "Close"; command "close"; width 6}.grid( :column => 3, :row => 3, :sticky => "we")
  button2 = Tk::Tile::Button.new(@@add_win) {text "Add"; command "add_entry"; width 6}.grid( :column => 2, :row => 4, :sticky => "we")
 
  $filename = TkVariable.new
  res_label = Tk::Tile::Label.new(@@add_win) {textvariable $filename; width 13; borderwidth 1; relief "groove"}.grid(:column => 1, :row => 1, :sticky => "n")
end


def add_entry
  if File.basename($filepath) == "LogInf.txt"
    File.open("LogInf.txt", "a+") do |file|
      if file.gets != nil 
        file.seek(0, IO::SEEK_END)
         file.puts "#{$newuser} " + "\t" "#{$newpass}\n"
       else
         file.puts "#{$newuser} " + "\t" "#{$newpass}\n"
       end
    end
    Tk::messageBox :message => "Entry Added!", :icon => "info"
    $newuser.value = ""
    $newpass.value = ""
    @@user_ent.focus
  else
    create_file
  end
end

def create_file
 file = File.new("APP_ROOT/LogInf.txt", "w")
 file.close
end

def close
  @@add_win.destroy 
end

end
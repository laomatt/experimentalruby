#require './module_demo.rb'
require_relative 'module_demo'




#puts RubyMonk::Parser::TextParser.parse('RubyMonk')


#p RubyMonk::Parser::TextParser.new.parse("matt")
#had to take the 'new' keyword out
    #why?  parse is a factory method, (because of the 'self.' keyword), therefore it does not of an object to be called, instead it may be called directly from the class in the modules.
    #modules containt Contants, methods and classes... but not variables.

p RubyMonk::Parser::TextParser.parse("matt")




#p Kata::Dojo::ScopeIn.push
#had to put the 'new' keyword in
    #why? Scope in is a method that is not static, or it does not belong to the class, but rather an instance of that class.  There fore we must first instatiate an obeject (this is what the 'new' keyword does), then call the push method of that object that was just created.
    #note:  the object is anonymous, as in we never gave it an actual variable name, thus it takes up no space in memory.  After this command is executed from this temporarily instantiate object, the object effectivly dissappears.

p Kata::Dojo::ScopeIn.new.push


p "selecting modules example"
#To directly call a method and sits inside, on the first level, or a module, simply use the '::' operator in order to locate the method.  The syntax follows: 'Module_Name::Thing_your_looking_for'
p Matt::add(3,4)  #=>prints out 7

#now if I had another method named 'add' (because it does the same thing almost), to avoid collisions in the name space , I could put that extra 'add' method into another module called Lao, while my original 'add' method is still in the Matt module.  To call each method, I would first have to call the Module, then use the :: operator to seach with in that module.

p Lao::add(3,4) #=>prints out 22
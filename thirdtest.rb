class Matthew

def initialize
  @name="unknown"
  @face="unknown"
  @clothes="unknown"
  @job="unknown"
  @location="unknown"
  @clothes="unknown"
end

def setname(name)
  @name=name
end

def setface(face)
  @face=face
end

def setclothes(dress)
  @clothes=dress
end

def setjob(occ)
  @job=occ
end

def setlocation(place)
  @location=place
end

def setclothes(rags)
  @clothes=rags

end

def intoduce_self
  "Hi, my name is #{@name}, and I am a #{@job}, living in #{@location}, on my face I have #{@face}.  I wear #{@clothes}."
end

end


Matt=Matthew.new
Matt.setname("Matt Lao")
Matt.setlocation("San Francisco")
Matt.setjob("DBC student")
Matt.setface("thick eyebrows and stubble")
Matt.setclothes("plain t-shirt and jeans")


#now I create another object from this class to describe myself in high school

highscoolMatt=Matthew.new
highscoolMatt.setname("Night Terror")
highscoolMatt.setlocation("the abyss of color and emptyness")
highscoolMatt.setjob("goth raver")
highscoolMatt.setface("heavy eye-liner and black lipstick")
highscoolMatt.setclothes("baggy raver pants and a long black trenchcoat")



#now I create another object from this class to describe myself in college

collegeMatt=Matthew.new
collegeMatt.setname("Mattyboy")
collegeMatt.setlocation("the college commons")
collegeMatt.setjob("parttime student, part-time Ultimate Frisby champ")
collegeMatt.setface("a really long bushy beard")
collegeMatt.setclothes("cargo shorts, sandals and graphic tees")



puts Matt.intoduce_self
puts highscoolMatt.intoduce_self
puts collegeMatt.intoduce_self
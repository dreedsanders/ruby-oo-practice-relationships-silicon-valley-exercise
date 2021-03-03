require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

dono=VentureCapitalist.new("Donovan", 1000000000)
jake=VentureCapitalist.new("Jake", 1000000001)
poop=VentureCapitalist.new("Poop", 50)

s1=Startup.new("s1", dono, "s1.com")
s2=Startup.new("s2", jake, "s2.com")
s3=Startup.new("s3", poop, "s3.com")

f1=FundingRound.new(s1, dono, "Angel", 5000)
f2=FundingRound.new(s1, jake, "Series A", 100000)
f3=FundingRound.new(s2, poop, "Pre-Seed", 50)
f4=FundingRound.new(s3, dono, "Series B", 50005)


#(startup, venture_capitalist, type, investment)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
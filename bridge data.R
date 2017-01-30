
add = character(50)
bridge = matrix(ncol = 6)
colnames(bridge) = c("id","fips", "year","deck","superstr","substr","traffic")
for (i in 1:50) {
  add[i] = paste("https://www.fhwa.dot.gov/bridge/nbi/",2016,"/",state.abb[i],16,".txt",sep = "")
  
  con = file(add[i],open= "r")
  line = readLines(con)
  id = substring(line,4,18)
  fips = paste(substring(line[1],1,2),substring(line,30,32),sep = "")
  year = substring(line,157,160)
  deck = substring(line,259,259)
  superstr = substring(line,260,260)
  substr = substring(line,261,261)
  traffic = substring(line,165,170)
  close(con)
  
  bridge=rbind(bridge,data.frame(id,fips, year,deck,superstr,substr,traffic))
}
  bridge = bridge[-1,]
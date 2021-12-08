require "sinatra"

get("/apple") do
  "<h1>Here is an apple.</h1>"
end
get("/banana") do
  "<h1>Here is a banana.</h1>"
end
get("/carrot") do
  "<h1>Here is a carrot.</h1>"
end

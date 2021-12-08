# project from Ruby with Sinatra basics
# 20211014 blh

require "sinatra"
require "uri"

def page_content(page_title)
  File.read("pages/#{page_title}.txt")
rescue Errno::ENOENT
  return nil
end

def save_content(page_title, some_content)
  File.open("pages/#{page_title}.txt", "w") do |a_file|
    a_file.print(some_content)
  end
end

def delete_content(page_title)
  File.delete("pages/#{page_title}.txt")
end

# Using an ERB or embedded ruby
# root path for website
get("/") do
  # if we have different layout pages
  # erb :welcome, layout: :page
  # if we have a default layout.erb page
  erb :welcome
end

get("/new") do
  erb :new
end

get("/:title") do
  @the_title = params[:title]
  @the_contents = page_content(@the_title)
  erb :show
end

get("/:title/edit") do
  @the_title = params[:title]
  @the_contents = page_content(@the_title)
  erb :edit
end

# {"title"=>"Anne", "body"=>"poet"}
post "/create" do
  save_content(params["title"], params["body"])
  redirect URI.escape("/#{params["title"]}")
end

put "/:title" do
  save_content(params["title"], params["body"])
  redirect URI.escape("/#{params["title"]}")
end

delete "/:title" do
  delete_content(params[:title])
  redirect "/"
end

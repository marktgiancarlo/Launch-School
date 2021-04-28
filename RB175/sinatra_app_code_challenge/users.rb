require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :all_users
end

get "/users/:name" do
  @name = params[:name]
  @email = @users[@name.to_sym][:email]
  @interests = @users[@name.to_sym][:interests]
  @other_users = @users.keys.reject { |key| key == @name.to_sym }

  erb :user
end

helpers do
  def count_interests
    interest_count = 0
    @users.each do |k, v|
      interest_count += @users[k][:interests].size
    end
    interest_count
  end
end

not_found do
  redirect "/"
end
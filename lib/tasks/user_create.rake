require 'pp'

namespace :user do
  desc "Create a devise user"
  task :create, [:email, :password] => :environment do |t, args|
    args = args.to_hash

    if args.has_key?(:email)
      email = args[:email]
    else
      print "E-mail?: "
      email = STDIN.gets.chomp
    end

    if args.has_key?(:password)
      password = args[:password]
    else
      print "Password: "
      password = STDIN.gets.chomp
    end

    user = User.create(:email => email, :password => password)

    if user.valid?
      print "User '#{user.email}' created.\n"
    else
      print "Failed to create: #{user.errors.messages}\n"
    end
  end
end
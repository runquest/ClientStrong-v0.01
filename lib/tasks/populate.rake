namespace :db do 
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Client, Workout].each(&:delete_all)

    Client.populate 10 do |client|
      client.name = Populator.words(1..3).titleize
      client.email = Faker::Internet.email
      client.start_date = 2.years.ago..Time.now
      client.age =  12..80
      client.active = ["true", "false"]
      client.avatar = Faker::Avatar.image
      Workout.populate rand(50) do |workout|
        workout.client_id = client.id
        workout.title = Populator.words(1..20).titleize
        workout.description = Populator.sentences(2..10)
        workout.date = 2.years.from_now..Time.now
        workout.created_at = 2.years.ago..Time.now
      end
    end
  end
end
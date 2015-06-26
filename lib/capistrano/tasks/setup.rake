namespace :setup do

  desc "Runs all tasks."
  task all: [:deploy]
#   task all: [:deploy, :seed_postgres, :seed_redis]

#   desc "Seed the main database."
#   task :seed_postgres do
#     on roles(:app) do
#       within "#{current_path}" do
#         with rails_env: :production do
#           execute :rake, "db:seed"
#         end
#       end
#     end
#   end
# 
#   desc 'Seed the redis database (search suggestions)'
#   task :seed_redis do
#     on roles(:app) do
#       within "#{current_path}" do
#         with rails_env: :production do
#           execute :rake, "search_suggestions:index"
#         end
#       end
#     end
#   end

  after "deploy:published", "deploy:start"

end
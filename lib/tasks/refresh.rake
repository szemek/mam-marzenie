require 'rest-client'

desc "Refresh page"
task :refresh do
  RestClient.get 'http://marzenie.herokuapp.com'
end


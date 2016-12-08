# API Curious

This project focuses on consuming and working with data from public APIs. I have recreated a version of the Github user profile page where user's can see their recent activity, repositories, starred repositories, followers, and those they follow.

Project details can be found here: [API Curious](http://backend.turing.io/module3/projects/apicurious)

Ruby Version: 2.3.1
<br>
Rails Version: 5.0.0.1

#### Setup

To run this project:

```
git clone git@github.com:epintozzi/api_curious.git
cd api_curious
bundle install
rake db:create db:migrate
rails s
```

#### Testing

This project uses RSpec for testing and can be run with the command `rspec`
<br>
You may need to `rake db:test:prepare` before running the tests.

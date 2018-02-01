<!-- update the badges for your repo accordingly -->
[ ![Codeship Status for LaunchPadLab/virtual_summit](https://app.codeship.com/projects/4e4d56a0-b995-0134-fe56-2eca6ea67861/status?branch=master)](https://app.codeship.com/projects/195059)
[![Code Climate](https://codeclimate.com/repos/587531a2c7b60e1d6600216d/badges/3da6cad9c7fd13b6b1d6/gpa.svg)](https://codeclimate.com/repos/587531a2c7b60e1d6600216d/feed)
[![Test Coverage](https://codeclimate.com/repos/587531a2c7b60e1d6600216d/badges/3da6cad9c7fd13b6b1d6/coverage.svg)](https://codeclimate.com/repos/587531a2c7b60e1d6600216d/coverage)
[![Issue Count](https://codeclimate.com/repos/587531a2c7b60e1d6600216d/badges/3da6cad9c7fd13b6b1d6/issue_count.svg)](https://codeclimate.com/repos/587531a2c7b60e1d6600216d/feed)

<!-- # TODO: APP NAME -->

## Getting Started
### Prerequisites
<!-- TODO: update the below accordingly -->
+ Ruby <!-- version # -->
+ Rails 5.1.4
+ Postgres
<!--
+ Node 6.9.1
+ Npm 4.1.1
+ [Foreman](https://github.com/ddollar/foreman) `gem install foreman`
+ [Yarn](https://yarnpkg.com/) They prefer installing via Homebrew (`brew update && brew install yarn`), but I would only suggest that if you have Node installed via Homebrew. I installed using `npm i -g yarn` and it seems to work, there are other methods as well, see `https://yarnpkg.com/en/docs/install` for more details.
 -->

### Running in Development
<!-- TODO: update the below accordingly -->
+ `git clone git@github.com:LaunchPadLab/virtual_summit.git`
+ `cd virtual_summit`
+ `bundle install && yarn install` <!-- remove yarn install if api only  -->
+ `load_secrets`
+ `bundle exec rake db:create db:migrate db:seed`
+ `rails server`
<!-- + `foreman start -f Procfile.dev` -->
+ `open localhost:3000`

<!--
  TODO: Additional notes about your app
This application supports both server rendering and client rendering of react components from within `ERB` templates.
Starting the application with `foreman start -f Profile.dev` starts the rails server as well as the webpack-dev-server that will rebuild the javascript assets on change.
It's possible that a page refresh completes BEFORE webpack finishes, just refresh again or check the log to make sure the rebuild has completed if you don't see your changes right away.
If this becomes an issue we can revisit to either optimize the build or add HMR.
 -->
### Development Workflow

#### Committing
Pull requests to the `dev` branch will trigger review apps in Heroku.
The `staging` branch will auto-deploy to the *staging* environment on Heroku.
The `master` branch can then be auto-deployed to *production* after successful QA.

#### Testing
All Ruby/Rails unit tests <!-- and Cypress integration tests --> must pass for a PR to be merged. They can be run locally with:

+ Ruby/Rails unit tests: `bundle exec rspec`
<!--
+ Cypress integration tests: `bin/cypress` (this will only work if your firewall allows it or is off and may require download and login to the app)
+ Node unit tests: `npm run test`
-->

#### Linting
The project is set up to lint ruby, <!-- javascript and scss (`TODO`) --> so its advised that you have this integrated in your editor.
Currently, linting errors will not block a PR merge, but this may change in the future.

You can run these manually with:
+ Ruby: `rubocop` (if installed globally with `gem install rubocop`)
<!-- + JavaScript: `npm run eslint` -->

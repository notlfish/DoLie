# DoLie

Webapp for rating pillows and mattresses. Inspired by twitter.

> This project was originally proposed by [Microverse](https://www.microverse.org/). Desing based on the one by [Gregoire Vella](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details).

## Built With

- Ruby 3.0.2
- Gems:
  - Bundler
  - RuboCop
  - RSpec
  - Rails

## Getting Started

**To use the code in this project, you'll need to have Ruby, Rails and Postgresql installed and configured in your computer. You'll need a postgresql user with deployer permissions**

To get a local copy up and running follow the following simple steps:

On GitHub bash:

  - To clone the project to your computer, run `https://github.com/notlfish/DoLie`
  - To enter the project folder, run `cd DoLie`.
  - To install the project dependencies, run `bundle install`
  - To set up the database, run `bundle exec rails db:create && bundle exec rails db:migrate`
  - To start the app, run `rails server`

### Routes
In this webapp you can access to the following routes:
- http://localhost:3000/ to go to the log in page (assuming you haven't yet logged in).
- Follow the links to sign up, if necessary.
- Follow the links to navigate the webapp.

### Prerequisites

Ruby, and Bundler must be installed on your computer (versions 3.0.1 and 2.2.15, respectively). Postgresql must be installed, and correnctly configured.

### Run tests
To run the tests, use the following commands
- `bundle exec rspec` to run all the tests.
- `bundle exec rspec spec/features` to run only the integration tests (this is time-consuming).
- `bundle exec rspec spec/models` to run only the unit tests.

**To run the integration tests, you'll need a Google Chrome variant installed in your system.**

## Authors

👤 **Lucas Ferrari Soto**

- GitHub: [@notlfish](https://github.com/notlfish)
- Twitter: [@LucasFerrariSo1](https://twitter.com/LucasFerrariSo1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/lucas-mauricio-ferrari-soto-472a3515a/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/notlfish/ruby-bubble-sort/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

This project was originally proposed by [Microverse](https://www.microverse.org/). Desing based on the one by [Gregoire Vella](https://www.behance.net/gregoirevella).

## 📝 License

This project is [MIT](./LICENSE) licensed.

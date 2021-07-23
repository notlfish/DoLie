# DoLie

> MVP of a social media app for sharing mattresses, pillows and other comfy stuff ratings. It features users, short opinions, and mentions. Inspired by twitter.

## Built With

- Ruby v3.0.2
- Ruby on Rails v6.1.4


## Screenshot
![Home](assets/homepage-screenshot.png)
![Profile](assets/profile-screenshot.png)

#### [Live version](https://fierce-river-41660.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby v3.0.2
- Ruby on Rails v6.1.4
- Postgres: >=9.5

### Setup

Install gems with dependencies:

```
bundle install
```

Setup database with:

**Configure postgress for the database to work**

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.
Use the pages links to navigate the webapp.

### Run tests
Run test from the project root directory
- `bundle exec rpsec` to run all the test
- `bundle exec rspec spec/models` to run unit tests
- `bundle exec rspec spec/features` to run integration tests.

**Chrome is needed to run the integration tests**


## Authors

👤 **Lucas Ferrari Soto**

- GitHub: [@notlfish](https://github.com/notlfish)
- Twitter: [@LucasFerrariSo1](https://twitter.com/LucasFerrariSo1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/lucas-mauricio-ferrari-soto-472a3515a/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Project required by [Microverse](https://www.microverse.org/). Project's design by [Gregoire Vella](https://www.behance.net/gregoirevella) in [Benhance](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details).

## 📝 License

[MIT](/LICENSE)

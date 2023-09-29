# Strada for Rails

[Strada](https://strada.hotwired.dev) enables you to create native controls in your hybrid mobile apps, driven by the web. Build web components and native components that work together in `WebView` screens to elevate your [Turbo Native](https://turbo.hotwired.dev/handbook/native) apps to the next level.

Strada for Rails makes it easy to use [strada-web](https://github.com/hotwired/strada-web) with both import-mapped and JavaScript-bundled apps. It relies on either `importmap-rails` to make Stimulus available via ESM or a Node-capable Rails (like via `jsbundling-rails`) to include Strada in the bundle. Make sure to install one of these first!

Read more on [strada.hotwired.dev](https://strada.hotwired.dev).

## Installation

1. Run `bundle add strada-rails`.
2. Run `rails strada:install`.
3. Generate your mobile projects using [turbo-native-initializer](https://github.com/lazaronixon/turbo-native-initializer).

The installer will automatically detect whether you're using an [import map](https://github.com/rails/importmap-rails) or [JavaScript bundler](https://github.com/rails/jsbundling-rails) to manage your application's JavaScript. If you're using an import map, the Strada dependencies will be pinned to the versions of the library included with this gem. If you're using Node, yarn will add the dependencies to your `package.json` file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lazaronixon/strada-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lazaronixon/strada-rails/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Strada::Rails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lazaronixon/strada-rails/blob/master/CODE_OF_CONDUCT.md).

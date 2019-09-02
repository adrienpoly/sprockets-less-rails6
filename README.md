# Sprockets Less Playground

Looking as some optimisation when moving all assets to Webpacker

## Part 1 : Inline Critical CSS with Purges CSS

Read more [dev.to](https://dev.to/adrienpoly/critical-css-with-rails-and-webpacker-sprocketsless-part-1-2bck)

Key take away the PostCSS config

```js
// postcss.config.js

const environment = ctx => ({
  plugins: [
    require("postcss-import"),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009"
      },
      stage: 3
    }),
    purgeCss(ctx)
  ]
});

const purgeCss = ({ file }) => {
  return require("@fullhuman/postcss-purgecss")({
    content: htmlFilePatterns(file.basename),
    defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || [],
    extractors: [
      {
        extractor: require("purgecss-from-html"),
        extensions: ["html"]
      }
    ]
  });
};

const htmlFilePatterns = filename => {
  switch (filename) {
    case "critical.scss":
      return [
        "./app/views/pages/index.html.erb",
        "./app/views/shared/_navbar.html.erb",
        "./app/views/layouts/application.html.erb"
      ];
    default:
      return [
        "./app/**/*.html.erb",
        "./config/initializers/simple_form_bootstrap.rb",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js"
      ];
  }
};

module.exports = ctx => environment(ctx);
```

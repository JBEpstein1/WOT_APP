module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss'),
    require('autoprefixer'),
    ...(process.env.NODE_ENV === 'production'
      ? [require('@fullhuman/postcss-purgecss')({
          content: [
            './app/**/*.html.erb',
            './app/helpers/**/*.rb',
            './app/javascript/**/*.js',
          ],
          defaultExtractor: content =>
            content.match(/[\w-/:]+(?<!:)/g) || [],
        })]
      : []),
  ],
};

const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// ProvidePluginを追加する
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'] // 追加
  })
);

module.exports = environment;
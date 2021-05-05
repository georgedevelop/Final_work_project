const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    datepicker: 'bootstrap-datepicker/js/bootstrap-datepicker.js',
    moment: 'moment/moment'
  })
)

module.exports = environment


const { defineConfig } = require('@vue/cli-service')

module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: '/kate/',
  chainWebpack: config => {
    config.plugin('html').tap(args => {
      args[0].title = 'Wedding with Kate — Организация свадеб в Санкт-Петербурге'
      return args
    })
  }
})

# handles JS and CSS generated by connect-assets
# thanks to https://github.com/fojas/express-coffee-handlebars
module.exports = (handlebars) ->
  handlebars.registerHelper 'js', (options) ->
    return js options.hash.file

  handlebars.registerHelper 'css', (options) ->
    return css options.hash.file
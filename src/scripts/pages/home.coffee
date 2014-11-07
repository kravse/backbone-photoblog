Home = Backbone.View.extend(
  init: (id) ->
    router = new Backbone.Router()
    router.navigate('/photos', {trigger: true})
)

Gallery = Backbone.View.extend(
  el: ".content"
  init: (options)->
    gals = ['tension', 'southeast', 'india', 'labour', 'days', 'portfolio', 'bolivia']
    if(gals.indexOf(options.id) == -1)
      router = new Backbone.Router()
      router.navigate('/projects', {trigger: true})
      return

    $('body').attr('class', 'gallery-page')
    @id = options.id + '-page'
    @render()

  render: ->
    template = _.template($("#gallery").html())
    this.$el.html(template(id: @id))
    return
)
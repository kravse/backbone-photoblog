About = Backbone.View.extend(
  el: ".content"

  init: ->
    $('body').attr('class', 'about-page')
    @render()

  render: ->
    template = _.template($("#about").html())
    this.$el.html(template())
    return
)
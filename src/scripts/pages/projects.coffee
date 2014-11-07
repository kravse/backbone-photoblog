Projects = Backbone.View.extend(
  el: ".content"

  init: (id) ->
    $('body').attr('class', 'project-page');
    @render()

  render: ->
    template = _.template($("#projects").html())
    this.$el.html(template())
    return
)

Photos = Backbone.View.extend(
  el: ".content"

  init: (options) ->
    $('.home .arrow').removeClass 'mobile-hidden'
    setTimeout (->
      $('.home .arrow').addClass 'mobile-hidden'
      return
    ), 2000

    @arrow = ''
    $('body').attr('class', 'photo-page');
    @id = parseInt(photosJson.length-1)
    @photoURL = photosJson[photosJson.length-1].code
    if(options.id)
      photoID = parseInt(options.id, 10)
      if parseInt(options.id, 10) && photoID<photosJson.length && photoID>0
        @photoURL = photosJson[options.id].code
        @id = parseInt(options.id)
  
    if @id == photosJson.length-1
      @arrow = 'right'
    else if @id == 1
      @arrow = 'left'

    @render()

  render: ->
    template = _.template($("#photos").html())
    this.$el.html(template(photoURL: @photoURL, id : @id, arrow: @arrow))
    App.preload(@id)
    return
)
Archive = Backbone.View.extend(
  el: ".content"
  init: (options) ->

    $('body').attr('class', 'archive-page')

    @photoArr = []
    @linkArr = []
    split = Math.floor(photosJson.length/24)
    extras = false

    if(Math.floor(photosJson.length%24)!= 0)
      split = split+1
      extras = true

    @arrow = ''
    top = 24
    bottom = 1

    if parseInt(options.id, 10) 
      @id = Math.floor(options.id)
      if @id >= split
        @id = split
      else if @id <= 1
        @id = 1
    else
      @id = split

    if @id == split
      @arrow = 'right'
    else if @id == 1
      @arrow = 'left'

    top = photosJson.length-((split-@id)*24)-1
    bottom = top - 23

    if extras && @id == 1
      top = photosJson.length%24-1
      bottom = 1

    for i in [bottom..top] by 1
      @linkArr.push(i)
      @photoArr.push(photosJson[i].code)
    
    @render()

  render: ->
    template = _.template($("#archive").html())
    this.$el.html(template(photoArr : @photoArr, linkArr: @linkArr, id: @id, arrow: @arrow))
    return
)
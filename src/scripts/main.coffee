photosJson = [{}]

App = 

  init: (json) ->

    if(json)
      photosJson = json

    $(document).on 'click', '.burger', ->
      App.toggleNav()

    $(document).on 'click', '.cover', ->
      App.toggleNav()

    $(document).on 'click', '.gallery-image', ->
      imgNum = $(this).attr('data-img')
      whichGal = $(this).attr('data-which')
      $('.gallery').addClass('show-popup')
      $('.popup').css('background-image', 'url("./images/projects/'+whichGal+'/gallery/'+imgNum+'.jpg")')

      galLen = $("."+whichGal+" .gallery-image").length
      
      App.setArrows(whichGal, imgNum)


    $(document).on 'click', '.gallery .arrow', ->
      $('.popup').css('background-image', 'url("./images/projects/'+$(this).attr('data-which')+'/gallery/'+$(this).attr('data-link')+'.jpg")')
      App.setArrows($(this).attr('data-which'), $(this).attr('data-link'))



    $(document).on 'click', '.popup', ->
      $('.popup').css('background-image', 'none')
      $('.gallery').removeClass('show-popup')

    $(document).on 'click', '.popup-bg', ->
      $('.popup').css('background-image', 'none')
      $('.gallery').removeClass('show-popup')

    $(document).on 'click', '.mobile-nav a', ->
      $(".container").attr('class', 'container mobile-closed').animate
          left: "0"
        , 500

    router = new Router()
    archive = new Archive()
    projects = new Projects()
    gallery = new Gallery()
    photos = new Photos()
    about = new About()
    home = new Home()

    router.on "route:home", () ->
      home.init()
      return

    router.on "route:photos", (id) ->
      photos.init({id: id})
      return

    router.on "route:about", ->
      about.init()
      return

    router.on "route:projects", ->
      projects.init()
      return

    router.on "route:archive", (id) ->
      archive.init({id: id})
      return

    router.on "route:gallery", (id) ->
      gallery.init({id: id})
      return

    Backbone.history.start()

  setArrows: (whichGal, imgNum) ->
    galLen = $("."+whichGal+" .gallery-image").length

    if(parseInt(imgNum) == 1)
      prev = parseInt(galLen)
    else
      prev = parseInt(imgNum) - 1

    if(parseInt(imgNum) == parseInt(galLen))
      next = 1
    else
      next = parseInt(imgNum) + 1

    $('.gallery .arrow-right').attr('data-link', next).attr('data-which', whichGal)
    $('.gallery .arrow-left').attr('data-link', prev).attr('data-which', whichGal)

    return
  
  toggleNav: () ->
    if $(".container").hasClass('mobile-closed')
      $(".container").removeClass('mobile-closed').addClass('mobile-open').animate
          left: "-180px"
        , 500
    else 
      $(".container").attr('class', 'container mobile-closed').animate
          left: "0"
        , 500

  preload: (id) ->

    for i in [id-5..id+5] by 1
      if(i <= photosJson.length && i != id && i>=0)
        img = new Image();
        img.src = ('http://jaredkrau.se/img/gal/'+photosJson[i-1].code);

  preloadArchive: (id) ->
    for i in [photosJson.length-24..photosJson.length] by 1
      if(i <= photosJson.length && i >= 0)
        img = new Image();
        img.src = ('http://jaredkrau.se/img/thumbnails/'+photosJson[i-1].code);
    


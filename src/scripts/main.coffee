photosJson = [{"datetime":"2014-03-22 00:59:07","code":"7IF9QABR4pL0waj.jpg","about":"Munich, Germany. 2011. "},{"datetime":"2014-03-22 01:01:06","code":"aAXTU5cqeogBWZ6.jpg","about":"Venice, Italy. 2011. "},{"datetime":"2014-03-22 01:01:47","code":"4tnYb3lS1QkCmZP.jpg","about":"Buenos Aires, 2011. "},{"datetime":"2014-03-22 01:02:56","code":"XsV9Y8EAhtz4eDm.jpg","about":"Rio de Janeiro, Brazil. 2011. "},{"datetime":"2014-03-22 01:04:17","code":"glZq5Bo0NAbUtv6.jpg","about":"Munich, Germany. 2011. "},{"datetime":"2014-03-22 01:05:58","code":"tRfsgiSFpz4xlmk.jpg","about":"Miami Beach, Florida, USA. 2013. "},{"datetime":"2014-03-22 01:07:08","code":"wE7PzSaK38C0Gcn.jpg","about":"Toronto. 2012. "},{"datetime":"2014-03-22 01:08:24","code":"JhvPQXkAq7TYO46.jpg","about":"Toronto, 2012. "}]

photosJson = [{}]

App = 

  init: (json) ->

    if(json)
      photosJson = json

    $(document).on 'click', '.burger', ->
      App.toggleNav()

    $(document).on 'click', '.cover', ->
      App.toggleNav()

    $(document).on 'click', '.hide-bottom-text', ->
      $('.home-about-text').css('opacity', '0')
      $(this).addClass('hidden')

    $(document).on 'click', '.switch-toggle', ->
      $('html').toggleClass('dark-theme')

    $(document).on 'click', '.gallery-image', ->
      imgNum = $(this).attr('data-img')
      whichGal = $(this).attr('data-which')
      $('body').addClass('show-popup')
      $('.popup').css('background-image', 'url("./images/projects/'+whichGal+'/gallery/'+imgNum+'.jpg")')

      galLen = $("."+whichGal+" .gallery-image").length
      
      App.setArrows(whichGal, imgNum)

    $(document).on 'click', '.gallery .arrow', ->
      $('.popup').css('background-image', 'url("./images/projects/'+$(this).attr('data-which')+'/gallery/'+$(this).attr('data-link')+'.jpg")')
      App.setArrows($(this).attr('data-which'), $(this).attr('data-link'))

    $(document).on 'click', '.popup', ->
      $('body').css('background-image', 'none')
      $('body').removeClass('show-popup')

    $(document).on 'click', '.popup-bg', ->
      $('.popup').css('background-image', 'none')
      $('body').removeClass('show-popup')

    $(document).on 'click', '.popup-close', ->
      $('.popup').css('background-image', 'none')
      $('body').removeClass('show-popup')
      
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
    
App = 

  toggleNav: () ->
    if $(".container").hasClass('mobile-closed')
      $(".container").removeClass('mobile-closed').addClass('mobile-open').animate
          left: "-180px"
        , 500
    else 
      $(".container").attr('class', 'container mobile-closed').animate
          left: "0"
        , 500

  init: () ->

    $(document).on 'click', '.burger', ->
      App.toggleNav()

    $(document).on 'click', '.cover', ->
      App.toggleNav()

    $(document).on 'click', '.mobile-nav a', ->
      $(".container").attr('class', 'container mobile-closed').animate
          left: "0"
        , 500

    router = new Router()
    archive = new Archive()
    projects = new Projects()
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

    Backbone.history.start()
      # {pushState: true, root: "/"})  

# this is temporary, until I hook it up to the existing project
photos = [{"datetime":"2014-03-22 00:59:07","code":"7IF9QABR4pL0waj.jpg","about":"Munich, Germany. 2011. "},{"datetime":"2014-03-22 01:01:06","code":"aAXTU5cqeogBWZ6.jpg","about":"Venice, Italy. 2011. "},{"datetime":"2014-03-22 01:01:47","code":"4tnYb3lS1QkCmZP.jpg","about":"Buenos Aires, 2011. "},{"datetime":"2014-03-22 01:02:56","code":"XsV9Y8EAhtz4eDm.jpg","about":"Rio de Janeiro, Brazil. 2011. "},{"datetime":"2014-03-22 01:04:17","code":"glZq5Bo0NAbUtv6.jpg","about":"Munich, Germany. 2011. "},{"datetime":"2014-03-22 01:05:58","code":"tRfsgiSFpz4xlmk.jpg","about":"Miami Beach, Florida, USA. 2013. "},{"datetime":"2014-03-22 01:07:08","code":"wE7PzSaK38C0Gcn.jpg","about":"Toronto. 2012. "},{"datetime":"2014-03-22 01:08:24","code":"JhvPQXkAq7TYO46.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:09:23","code":"kXP9Nyj2o1JLnmI.jpg","about":"Toronto Fashion Week. March, 2012. "},{"datetime":"2014-03-22 01:09:49","code":"FoL4c5I0rYaPl7x.jpg","about":"Toronto Fashion Week, March 2012. "},{"datetime":"2014-03-22 01:11:45","code":"tG13VS6mLYgQ5z2.jpg","about":"Mumbai, India. 2012. "},{"datetime":"2014-03-22 01:12:27","code":"eZka0UCgBr4ciVR.jpg","about":"Mumbai, India. 2012. "},{"datetime":"2014-03-22 01:13:03","code":"qKmGCtIVRFnlvfZ.jpg","about":"Mumbai, India. 2012. "},{"datetime":"2014-03-22 01:14:01","code":"AMhdTkOlCtXDRGK.jpg","about":"Delhi, India. 2012. "},{"datetime":"2014-03-22 01:14:21","code":"Bjvey7ontWHmA3x.jpg","about":"Delhi, India. 2012. "},{"datetime":"2014-03-22 01:14:59","code":"WB30FNh5diRrzak.jpg","about":"\"Brother\" - Delhi, India. 2012. "},{"datetime":"2014-03-22 01:16:08","code":"52jZTgqahvAMoYJ.jpg","about":"Kodak Portra. Mumbai, India. 2012. "},{"datetime":"2014-03-22 01:17:34","code":"i2E8trH5vCPnAZs.jpg","about":"This is candid. Shot with film. Toronto, 2012. "},{"datetime":"2014-03-22 01:18:26","code":"w7yhPNaxo8tE4Ks.jpg","about":"Shot with film. Toronto, 2012. "},{"datetime":"2014-03-22 01:19:15","code":"otF9yHBxWfVeIA4.jpg","about":"\"Sisters\" - Shot with film. Toronto, 2012. "},{"datetime":"2014-03-22 01:20:01","code":"EvHK5uwPncNGVTU.jpg","about":"Shot with cheap film. Toronto, 2012. "},{"datetime":"2014-03-22 01:20:54","code":"s4CjxJdpRZowKWc.jpg","about":"Kodak Portra 2. Toronto, 2012. "},{"datetime":"2014-03-22 01:22:22","code":"WyfSqAheltGbzX9.jpg","about":"\"No Mans Land\" - Toronto, 2012. "},{"datetime":"2014-03-22 01:23:23","code":"Epv0A8qQiJTXlxb.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:25:21","code":"KzXYAPgyE4W86bt.jpg","about":"From the project \"Days\". 2012. "},{"datetime":"2014-03-22 01:30:19","code":"cFhr5zabiMSxuj9.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:31:27","code":"iEj8s40ADrYNHBt.jpg","about":"From the project \"Days\". 2012. "},{"datetime":"2014-03-22 01:32:58","code":"S16A0eulCam7FXE.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:34:00","code":"lhB7XMTpfg1RA5N.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:34:20","code":"YjMxT5ILiUX16pA.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:35:29","code":"nkr15sd9QEeiz2G.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:36:04","code":"fr8oRYqxih6DOdp.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:36:31","code":"LjgfG4qlMhJ670d.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:36:57","code":"nFkJI7MAtwXphZW.jpg","about":"Toronto, 2012. "},{"datetime":"2014-03-22 01:37:45","code":"6YA0pX3alK8OLnM.jpg","about":"Georgia, USA. 2012. "},{"datetime":"2014-03-22 01:38:24","code":"N5zdsA238R67Qht.jpg","about":"Miami Beach, Florida, USA. 2013. "},{"datetime":"2014-03-22 01:38:53","code":"5FToiUamRASEHlY.jpg","about":"Miami Beach, Florida, USA. 2013. "},{"datetime":"2014-03-22 01:40:11","code":"TweNJq9uvGSOsk1.jpg","about":"From my project \"Labour\". Newmarket 2013. "},{"datetime":"2014-03-22 01:43:54","code":"wnce9OMxgHGtUB0.jpg","about":"From my project \"Labour\". Newmarket 2013. "},{"datetime":"2014-03-22 01:46:23","code":"uvJDOz3wxLFWjyM.jpg","about":"This if from the project \"Labour\". I shot the project while working construction in 2013. The whole set is taken with an iPhone 5."},{"datetime":"2014-03-22 01:47:03","code":"oYUfM47WbDOXEtj.jpg","about":"Toronto, 2013. "},{"datetime":"2014-03-22 01:47:45","code":"1J9orW2UwPzFZHk.jpg","about":"Toronto, 2013. "},{"datetime":"2014-03-22 01:50:12","code":"Hr6NanADkxGXKzg.jpg","about":"Ho Chi Minh City, Vietnam. 2013. "},{"datetime":"2014-03-22 01:50:40","code":"02QPxZLHaB7EySj.jpg","about":"Phnom Penh, Cambodia. 2013. "},{"datetime":"2014-03-22 01:51:03","code":"SgQT9jC7bozr4fv.jpg","about":"Bangkok Thailand. "},{"datetime":"2014-03-22 01:51:24","code":"DXp6McSLtmd7EiA.jpg","about":"Siem Reap, Cambodia. 2013. "},{"datetime":"2014-03-22 01:51:47","code":"x9iJElSWhozY4D8.jpg","about":"Bangkok, Thailand. 2013. "},{"datetime":"2014-03-22 01:52:14","code":"nEJVy2A1dz7SF8l.jpg","about":"Bangkok, Thailand. 2013. "},{"datetime":"2014-03-22 01:52:30","code":"xhLTa50t7nBolZv.jpg","about":"Bangkok, Thailand. 2013. "},{"datetime":"2014-03-22 01:53:25","code":"rIH6WbBZsAQkwEi.jpg","about":"Toronto, 2013. "},{"datetime":"2014-03-22 01:53:50","code":"yUCSzQHAFp2O4vn.jpg","about":"Toronto, 2013. "},{"datetime":"2014-03-22 01:57:16","code":"GLS7rfsUkvn8K3I.jpg","about":"Over the next little while, I will be shooting photos for a book that explores colour in the downtown core. I will be shooting it with an iPhone 5. This is the one of the first photos from the series."},{"datetime":"2014-04-15 11:52:33","code":"jVDQNSOc8ipxwRa.jpg","about":"Secure everything. Toronto, 2014. iPhone 5. "},{"datetime":"2014-04-16 22:59:58","code":"qAvxNwTtB2DmSrf.jpg","about":"Kensington market. 2014. iPhone 5. "},{"datetime":"2014-04-20 18:30:42","code":"KeF1uyiVlPUtnd9.jpg","about":"iPhone 5. "},{"datetime":"2014-05-09 10:44:08","code":"vLATpWYVfs9lcjz.jpg","about":"This week I'm posting for Burn Magazine's @burndiary<\/a> on Instagram. Burn Magazine is curated by Magnum's David Alan Harvey<\/a>. The goal of Burn Diary is to showcase what photographers can do in a week, with no time to prepare, just shooting and posting. It's been a real challenge, but so far I've really been enjoying it. Follow along if you're interested, but definitely check out Burn if you haven't at burnmagazine.org<\/a>."},{"datetime":"2014-05-26 20:38:40","code":"pubs4VZogX0EK1z.jpg","about":"A parade, in La Paz, Bolivia. 2014. "},{"datetime":"2014-05-26 20:41:55","code":"h9QRFnNm7y0CHEY.jpg","about":"Women from the indigenous Aymara culture wear bowler hats. They are a common site in La Paz. "},{"datetime":"2014-05-26 20:45:06","code":"UdPaoHhnRk94w6W.jpg","about":"An Aymara woman and her child in La Paz, Bolivia. "},{"datetime":"2014-05-26 20:45:47","code":"hdvU85qLmZNjYxc.jpg","about":"Taken in the Bolivian Amazon. "},{"datetime":"2014-05-26 20:46:20","code":"uQwl6c4aTDysSM7.jpg","about":"It was really sunny in La Paz. "},{"datetime":"2014-05-26 20:47:06","code":"JkQCSK1pmATxn9Z.jpg","about":"La Paz, Bolivia. 2014. "},{"datetime":"2014-05-26 20:49:44","code":"51Ikq3VyAWNMsc9.jpg","about":"Central La Paz, Bolivia. 2014. "},{"datetime":"2014-06-12 14:35:56","code":"kTMa6pNv1G90LFb.jpg","about":"La Paz, Bolivia."},{"datetime":"2014-07-05 19:05:35","code":"sJj3kb2MpocX6Cw.jpeg","about":"iPhone 5. "},{"datetime":"2014-07-17 21:27:13","code":"PJtB7OAEx81uTvl.jpg","about":"La Paz, Bolivia. iPhone 5. "},{"datetime":"2014-08-04 22:43:21","code":"Yh87DEgWJiHtTyZ.jpg","about":"San Francisco, USA. "},{"datetime":"2014-08-06 15:34:11","code":"vVXwy9h712dJ5xO.jpg","about":"Pier 39, San Francisco, USA. "},{"datetime":"2014-08-08 02:07:29","code":"ZWLTJrAc1DaqOGP.jpg","about":"Market St. \"The Tenderloin\", San Francisco, USA"},{"datetime":"2014-08-08 21:32:20","code":"gpQUZv7A56OSWlw.jpg","about":"San Francisco, USA. "},{"datetime":"2014-08-09 20:03:35","code":"U8HzrnytjN5ZqIb.jpg","about":"San Francisco, USA. "},{"datetime":"2014-08-24 01:43:05","code":"OxLwAXsTkNZrp5Y.jpg","about":"Weddings."},{"datetime":"2014-09-07 18:24:56","code":"XJGB5Vio6zs1dQ8.jpg","about":""},{"datetime":"2014-09-07 19:33:38","code":"Rir8denpECku21S.jpg","about":"\"The Act\""},{"datetime":"2014-10-26 00:31:43","code":"26vwHOY9pR3NsaG.jpg","about":"The Junction, Dundas Street, Toronto. "}]
# http://jaredkrau.se/img/gal/
Router = Backbone.Router.extend(
  routes:
    "(/)" : "home"
    "archive(/)": "archive"
    "archive(/):id(/)": "archive"
    "photos(/)": "photos"
    "photos/:id(/)": "photos"
    "projects(/)": "projects"
    "about(/)": "about"
)


Users = Backbone.Collection.extend(url: "/")

Archive = Backbone.View.extend(
  el: ".content"
  init: (options) ->

    $('body').attr('class', 'archive-page')

    @photoArr = []
    @linkArr = []
    split = Math.floor(photos.length/24)
    extras = false

    if(Math.floor(photos.length%24)!= 0)
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

    top = photos.length-((split-@id)*24)-1
    bottom = top - 23

    if extras && @id == 1
      top = photos.length%24-1
      bottom = 1

    for i in [bottom..top] by 1
      @linkArr.push(i)
      @photoArr.push(photos[i].code)
    
    @render()

  render: ->
    template = _.template($("#archive").html())
    this.$el.html(template(photoArr : @photoArr, linkArr: @linkArr, id: @id, arrow: @arrow))
    return
)

Projects = Backbone.View.extend(
  el: ".content"

  init: (id) ->
    $('body').attr('class', 'project-page');
    @test = 'abc'
    @render()

  render: ->
    template = _.template($("#projects").html())
    this.$el.html(template(test : @test))
    return
)

About = Backbone.View.extend(
  el: ".content"

  init: ->
    $('body').attr('class', 'about-page');
    @test = 'abc'
    @render()


  render: ->
    template = _.template($("#about").html())
    this.$el.html(template(test : @test))
    return
)

Home = Backbone.View.extend(
  init: (id) ->
    router = new Backbone.Router()
    router.navigate('/photos', {trigger: true})
)

Photos = Backbone.View.extend(
  el: ".content"

  init: (options) ->
    @arrow = ''
    $('body').attr('class', 'photo-page');
    @id = parseInt(photos.length-1)
    @photoURL = photos[photos.length-1].code

    if(options.id)
      photoID = parseInt(options.id, 10)
      if parseInt(options.id, 10) && photoID<photos.length && photoID>0
        @photoURL = photos[options.id].code
        @id = parseInt(options.id)
  
    if @id == photos.length-1
      @arrow = 'right'
    else if @id == 1
      @arrow = 'left'

    @render()

  render: ->
    template = _.template($("#photos").html())
    this.$el.html(template(photoURL: @photoURL, id : @id, arrow: @arrow))
    return
)


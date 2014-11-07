Router = Backbone.Router.extend(
  routes:
    "(/)" : "home"
    "archive(/)": "archive"
    "archive(/):id(/)": "archive"
    "gallery(/)": "gallery"
    "gallery/:id(/)": "gallery"
    "photos(/)": "photos"
    "photos/:id(/)": "photos"
    "projects(/)": "projects"
    "about(/)": "about"
)
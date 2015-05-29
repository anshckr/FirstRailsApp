RailsApp.Routers = new (Backbone.Router.extend({
  // el: '#railsapp table',
  routes: { '': 'index',
    'users/:id': 'show',
    'signup': 'instantiate'
  },

  instantiate: function(){
    this.signupView = new RailsApp.Views.Signup();
    $("#yield").html(this.signupView.el);
  },

  index: function(){
    // this.userList = new RailsApp.Collections.Users();
    // this.userListView = new RailsApp.Views.Users({collection: this.userList});
    // this.userList.fetch({reset: true});
  },

  initialize: function () {
    this.userList = new RailsApp.Collections.Users();
    this.userListView = new RailsApp.Views.Users({collection: this.userList});
    this.userList.fetch({reset: true});
  },
  
  show: function(){
    this.indexView = new RailsApp.Views.User();
    
    $("#yield").html(this.indexView.el);
  }
}));
window.RailsApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {}
}

$(function(){
  RailsApp.AppView = new (Backbone.View.extend({
    
    template: _.template('<div> Hello Anshul </div>'),
    
    start: function(){
      Backbone.history.start({pushState: true});
    },
    
    // render: function(){
    //   debugger
    //   // this.$el.append(JST['users/index']());
      
    // },

    initialize: function(){
    }

  }))({el: document.body})
  
  // RailsApp.AppView.render();
  
  RailsApp.AppView.start();
});
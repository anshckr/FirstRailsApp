RailsApp.Views.Users = Backbone.View.extend({
  template: _.template(JST['users/index']()),
  render: function(){
    this.addAll();
  },

  addAll: function(){
    this.collection.forEach(this.addOne, this);
  },

  addOne: function(user){
      var self = this;
      var userView = new RailsApp.Views.User({model: user});
      this.$el.html(this.template());
      this.$el.find('tbody').append(userView.render().el);
  },

  initialize: function(){
    this.collection.on('add', this.addOne, this);
    this.collection.on('reset', this.addAll, this);
  }
})
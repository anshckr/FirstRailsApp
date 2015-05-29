RailsApp.Views.Signup = Backbone.View.extend({
  el: '#signup-view',

  model: RailsApp.Models.User,

  events: { 'submit form': 'createUser' },

  createUser: function (event) {
    event.preventDefault();
    var self = this,
    user = new RailsApp.Models.User();
    user.set({
      'name' : this.$el.find("input[name='user[name]']").val(),
      'email': this.$el.find("input[name='user[email]']").val(),
      'password': this.$el.find("input[name='user[password]']").val(),
      'password_confirmation': this.$el.find("input[name='user[password_confirmation]']").val()
    });
     user.save(null, {
      success: function(model, response, options){
         Backbone.history.navigate('users/' + response.id, {trigger: true});
      },
      error: function(model, xhr, options){
        var errors = JSON.parse(xhr.responseText).errors;
        alert("Error : " + errors);
      }
     });
  },

  initialize: function(){
  }

  // render: function(){
  //   return this;
  // }
});
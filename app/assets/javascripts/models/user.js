RailsApp.Models.User = Backbone.Model.extend({
  paramRoot: 'user',
  urlRoot: '/users',  
  toJSON: function(){ // Will be required duing user.save()
      var attrs = _.clone(this.attributes);
      attrs = _.pick(attrs, 'name', 'email', 'password', 'password_confirmation');
      return attrs // Object that will be sent to the server
    },

    initialize: function(){
    }
});

RailsApp.Models.User.authorize = function (attrs, callback) {
  var user = new User({email: attrs.email});
  user.authenticate(attrs.password, callback);
};
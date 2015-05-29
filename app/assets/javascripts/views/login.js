RailsApp.Views.Login = Backbone.View.extend({
  el: '#login-view',
  events: { 'submit form':   'authorize' },

  authorize: function (event) {
    event.preventDefault();
    var self = this,
        attrs = {
          email: this.emailField.val(),
          password: this.passwordField.val()
        };
    RailsApp.Models.User.authorize(attrs, function (err, user) {
      debugger
      if (err) { self.loginFailure(); }
      else { self.loginSuccess(); }
    });
    return (this.form.data('user-authorized') === true);
  },

  loginSuccess: function () {
    debugger
    this.form.data('user-authorized', true);
    this.form.submit();
  },

  loginFailure: function () {
    debugger
    this.$el.animate({left: '-=20'}, 100);
    this.$el.animate({left: '+=40'}, 100);
    this.$el.animate({left: '-=40'}, 100);
    this.$el.animate({left: '+=40'}, 100);
    this.$el.animate({left: '-=20'}, 100);
    this.emailField.focus();
    this.submitButton.removeClass('disabled');
  },

  initialize: function () {
    debugger
    this.form = this.$el.find('form');
    this.emailField = this.$el.find("input[name='session[email]']");
    this.passwordField = this.$el.find("input[name='session[password]']");
    this.submitButton = this.$el.find('input[type=submit]');
  }

});
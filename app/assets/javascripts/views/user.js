RailsApp.Views.User = Backbone.View.extend({
    tagName: 'tr',

    render: function () {
      this.$el.html(JST['users/view']({ model: this.model }));
      return this;
    },

    initialize: function(){
      this.model.on('hide', this.remove, this);
    },

    remove: function(){
      this.$el.remove();
    }
})
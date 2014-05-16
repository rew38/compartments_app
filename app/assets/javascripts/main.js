var Compartment, CompartmentList, compartments;

$(function(){
  // class Compartment < ActiveRecord::Base
  Compartment = Backbone.Model.extend();

  CompartmentList = Backbone.Collection.extend({
    url: "/compartments",
    model: Compartment
  });

  CompartmentView = Backbone.View.extend({

  });

  CompartmentTreeView = Backbone.View.extend({
    render: function(){
      $("body").html("YO!");
    }
  });

  compartments = new CompartmentList;

  compartments.fetch();

  knicksView = new CompartmentView({model: compartments.models[0]});
  allView = new CompartmentTreeView({collection: compartments});

  // allView.render();


})

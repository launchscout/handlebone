handlebone
===================

This gem is extracted out of a backbone project where we are using handlebars
templates. It contains:

* handlebars.js
* A HandlebarsView superclass
* a rails helper module for rendering all your handlebars templates into your rails view
* Some handlebars helpers to make things easier

Usage
=====

This gem is designed to integrate with the asset pipeline of rails 3.1+.  Somewhere in your 
coffeescript or javascript code you'll need to require it:

    #= require handlebars_view
    
This will bring in handlebars and the view superclass.  To use it, write a view like so:

    class FooView extends HandlebarsView
    
      name: "foo_view"
      
This will cause the view to look for a template in an element with id "foo_view_template" and use 
handlebars to render this view, passing in the view's model as the template 
context.  You can change this by overriding the templateContext function in your view.

HandlebarsHelpers
=================

Some helper methods to make writing those templates easier. 

    {{get "property"}}

This will grab a property from the model that is the current context

    {{#eachProperty "children"}}hi!{{/eachProperty}}

A block helper that iterates over a property that contains an array.

Somewhere in your DOM ready, you'll need to call registerHelpers.  Like so:

    $ -> Backbone.HandlebarsHelpers.registerHelpers()

Also, you can register your own helpers by passing an object where each propery is a method that will 
become a helper

    Backbone.HandlebarsHelpers.registerHelpers(new MyHelpers())
    
RenderTemplatesHelper
======================

We've found it best practice to keep our handlebars templates  in separate files so our rails 
views don't get all noisy.  This all let's use the same HandleBars view on more than one rails 
view and in our jasmine specs.  This gem also includes a rails helper module RenderTemplatesHelper.
Best to just look at the code to see what it does for now, it's super simple.

class SimpleView extends Backbone.HandlebarsView
  name: "simple_view"

class window.ParentView extends Backbone.HandlebarsView
  name: "parent_view"
  
class window.ChildView extends Backbone.HandlebarsView
  name: "child_view"
  findEl: -> @el = $("#child")
  
class window.MultipleChildParentView extends Backbone.HandlebarsView
  name: "multiple_child_parent_view"

class window.SimpleModel extends Backbone.Model

describe "HandlebarsView", ->
  beforeEach ->
    Backbone.HandlebarsHelpers.registerHelpers()
  describe "SimpleView", ->
    beforeEach ->
      setFixtures "<div id='simple_view'></div>"
      loadTemplate "simple_view.handlebars.html"
      @simpleView = new SimpleView(model: new SimpleModel(foo: "bar"))
      @simpleView.render()
    it "finds it's el", ->
      expect(@simpleView.el).toExist()
    it "can render model data", ->
      expect(@simpleView.el.html()).toMatch /bar/
      
  describe "subviews", ->
    beforeEach ->
      setFixtures "<div id='parent_view'></div>"
      loadTemplate "parent_view.handlebars.html"
      loadTemplate "child_view.handlebars.html"
      @parentView = new ParentView(model: new SimpleModel(id: 1))
      @parentView.render()
    it "renders the child template too", ->
      expect(@parentView.el.html()).toMatch /Foo/
    it "has a child view as a subviews", ->
      expect(@parentView.subViews.length).toEqual(1)
  
  describe "multiple child views", ->
    beforeEach ->
      setFixtures "<div id='multiple_child_parent_view'></div>"
      loadTemplate "multiple_child_parent_view.handlebars.html"
      loadTemplate "simple_view.handlebars.html"
      children = [new SimpleModel(id: 1, foo: "baz"), new SimpleModel(id: 2, foo: "bing")]
      @multipleChildParentView = new MultipleChildParentView(model: new SimpleModel(children: children))
      @multipleChildParentView.render()
    it "renders children views", ->
      expect(@multipleChildParentView.el.html()).toMatch /baz/
      expect(@multipleChildParentView.el.html()).toMatch /bing/
    
    
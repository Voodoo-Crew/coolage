# Require.js #

## Map Config ##

RequireJS allows you to centrally manage dependency mappings (using a map config)
so you can easily replace the version of a module that is injected in other modules.
In the map configuration below, I mapped the "app/models/employee" dependency to the
"app/models/memory/employee" module which is a simple in-memory data provider.
You can easily replace the in-memory data with actual JSON services throughout the application by
replacing "app/models/memory/employee" with "app/models/json/employee" in the mapping below defined in app.js.

```javascript
require.config({
    baseUrl: 'js/lib'
  , paths: {
        app: '../app'
      , tpl: '../tpl'
    }
  , map: {
      '*': {
        'app/models/employee': 'app/models/memory/employee'
      }
    }
  , shim: {
      backbone: {
          deps: ['underscore', 'jquery']
        , exports: 'Backbone'
      }
    , underscore: {
        exports: '_'
      }
    }
});
```

---

## Text plugin ##

It is nice to build HTML using regular HTML tags, instead of building up DOM structures in script.
However, there is no good way to embed HTML in a JavaScript file.
The best that can be done is using a string of HTML, but that can be hard to manage,
particularly for multi-line HTML.

The text.js AMD loader plugin can help with this issue. It will automatically be loaded
if the text! prefix is used for a dependency. Download the plugin and put it in the
app's baseUrl directory (or use the paths config to place it in other areas).

You can specify a text file resource as a dependency like so:

### Example 1 ###

```javascript
require([
    'some/module'
  , 'text!some/module.html'
  , 'text!some/module.css'
], function (moduleInstance, htmlDoc, cssDoc) {
  // the html variable will be the text
  // of the some/module.html file
  // the css variable will be the text
  // of the some/module.css file.
});
```

### Example 2 ###

```javascript
require(['text!some/module.html!strip'], function (html) {
  // the html variable will be the text of the
  // some/module.html file, but only the part
  // inside the body tag.
});
```

---

:scorpius:

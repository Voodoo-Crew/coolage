# React #

**React** - is a JavaScript library for building user interfaces.

Below is a list of notes made while reading the official [React documentation](https://reactjs.org/docs/)

---

## Converting a Function to a Class ##

You can convert a function component to a class in five steps:

1. Create an [ES6 class](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Classes), with the same name, that extends `React.Component`.
2. Add a single empty method to it called `render()`.
3. Move the body of the function into the `render()` method.
4. Replace `props` with `this.props` in the `render()` body.
5. Delete the remaining empty function declaration.

```javascript
class Clock extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.props.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```
---

## Lifecycle Methods ##

```javascript
class LifecyclesList extends React.Component {


  constructor(props) {
    super(props);
    this.state = {};
  }


  // Runs after the component output has been rendered to the DOM.
  componentDidMount() {
    this.setState({
      newProp: "Initial Value"
    });
  }


  // If the component is ever removed from the DOM, React calls it:
  componentWillUnmount() {

  }


  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
      </div>
    );
  }
}
```
---

## Using State Correctly ##

There are three important things about `setState()`

### Do Not Modify State Directly ###

```javascript
// Wrong
this.state.comment = 'Hello';
```
Instead, use `setState()`:

```javascript
// Correct
this.setState({comment: 'Hello'});
```

The only place where you can assign `this.state` is the constructor.

### State Updates May Be Asynchronous ###

React may batch multiple `setState()` calls into a single update for performance.
Because `this.props` and `this.state` may be updated asynchronously,
you should not rely on their values for calculating the next state.

```javascript
// Wrong
this.setState({
  counter: this.state.counter + this.props.increment,
});
```

Instead use a second form of `setState()` that accepts a function rather than
an object. That function will receive the previous state as the first argument,
and the props at the time the update is applied as the second argument:

```javascript
// Correct
this.setState((state, props) => ({
  counter: state.counter + props.increment
}));
```
It also works with regular functions:

```javascript
// Correct
this.setState(function(state, props) {
  return {
    counter: state.counter + props.increment
  };
});
```

### State Updates are Merged ###

When you call `setState()`, React merges the object you provide into the current
 state. For example, your state may contain several independent variables:

```javascript
constructor(props) {
  super(props);
  this.state = {
    posts: [],
    comments: []
  };
}
```

Then you can update them independently with separate `setState()` calls:

```javascript
componentDidMount() {
  fetchPosts().then(response => {
    this.setState({
      posts: response.posts
    });
  });

  fetchComments().then(response => {
    this.setState({
      comments: response.comments
    });
  });
}
```
The merging is shallow, so `this.setState({comments})` leaves `this.state.posts` intact, but completely replaces `this.state.comments`.

---

## Handling Events ##

Handling events with React elements is very similar to handling events on DOM elements.

There are some syntactic differences:

- React events are named using camelCase, rather than lowercase.
- With JSX you pass a function as the event handler, rather than a string.
- You cannot return false to prevent default behavior in React. You must call `preventDefault` explicitly.

## Preventing Component from Rendering ##

In rare cases you might want a component to hide itself even though it was rendered by another component.
To do this return `null` instead of its render output.

Returning `null` from a component’s render method does not affect the firing of the component’s lifecycle methods. For instance `componentDidUpdate` will still be called.

---

## List of articles used ##

[React lifecycle diagram](http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/)

---

:scorpius:

# React #

**React** - is a JavaScript library for building user interfaces.

Below is a list of notes made while reading the official [React](https://reactjs.org/docs/) documentation

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

### Related Articles ###

 - [React](https://reactjs.org/docs/)
 - [React Native](http://facebook.github.io/react-native/)

---

:scorpius:

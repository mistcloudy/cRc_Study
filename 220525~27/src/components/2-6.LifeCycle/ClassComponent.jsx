import React, { Component } from 'react'

export default class ClassComponent extends Component {
    constructor(props) {
        super(props);
        console.log('constructor');
        this.state = {date: new Date()};
        //this.handleClick = this.handleClick.bind(this);
    }

    componentDidMount(){
        console.log('componentDidMount');
        this.timerID = setInterval(() => this.tick(), 1000);
    }

    componentDidUpdate(){
        //console.log('componentDidUpdate');

    }

    componentWillUnmount(){
        console.log('componentWillUnmount');
        clearInterval(this.timerID);
    }

    tick(){
        //console.log('tick');
        this.setState({ date: new Date()});
    }

    handleClick = () => {
      alert(this.state.date);
    }

  render() {
      console.log('render');
      // this를 사용하고 싶다면 생성자에서 자신을 bind 해 줘야 한다.
      // 다만, arrow function일 경우는 제외
    return (
      <div>
        <h1 onClick={this.handleClick}>Hello, world!</h1>
        <h2>{this.state.date.toLocaleTimeString()}</h2>
      </div>
    )
  }
}

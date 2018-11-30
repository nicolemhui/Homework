import React from 'react';
// import { parse } from 'querystring';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: ""; num2: ""; result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addition = this.result.bind(this);
    this.subtraction = this.result.bind(this);
    this.multiplication = this.result.bind(this);
    this.division = this.result.bind(this);
    this.clear = this.clear.bind(this);
  }

  render() {
    const { num1, num2, result } = this.state;

    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} id="num1" value="{num1}"/>
        <input onChange={this.setNum2} id="num2" value="{num2}"/>  
        <br/>
        
        <button onClick={this.addition}>+</button>
        <button onClick={this.subtraction}>-</button>
        <button onClick={this.multiplication}>*</button>
        <button onClick={this.division}>/</button>
        <br/>
        <button onClick={this.clear}>Reset!</button>
      </div>
    );
  }
  
  setNum1(e) {
    //target will be the input el which is a string; have to parse into an integer 
    const num1 = e.target.value 
    if (num1) {
      num1 = parseInt(e.target.value);
    } else {
      num1 = "";
    }
    this.setState({ num1 });
  }

  setNum2(e) {
    const num2 = e.target.value 
    if (num2) {
      num2 = parseInt(e.target.value);
    } else {
      num2 = "";
    }
    this.setState({ num2 });
  }

  addition(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtraction(e) {
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result });    
  }

  multiplication(e) {
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result });    
  }

  division(e) {
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({ result });    
  }

  clear(e) {
    e.preventDefault();
    this.setState({ num1: ""; num2: ""; result: 0 });
  }
}

export default Calculator;

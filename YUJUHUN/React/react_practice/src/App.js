import React from 'react';
import Hello from './Hello';
import Wrapper from './Wrapper';
import Counter from './Counter';
import './App.css' // css + className
import InputSample from './InputSample';


function App() {
  const name = 'react'; // Javascript value include JSX
  const style = {
    backgroundColor : 'brown',
    color : 'aqua',
    fontSize : 24, 
    padding : '1rem'
  } // style
  return (
    <Wrapper> 
      <Hello />  {/* self closing */}
      <div>Bye</div>  {/* JSX Comment*/}
      <div style={style}>{name}</div> 
      <div className="gray-box"></div> 
      {/* properties */}
      <Hello name="react" color="red" isSpecial/>
      <Hello color="pink" />
      <Counter />
      <InputSample />
    </Wrapper> 
  );
} 

export default App;

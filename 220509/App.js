import React from 'react';
import Hello from './Hello';
import './App.css';
import Wrapper from './Wrapper';
import Counter from './Counter';
import InputSample from './InputSample';


function App() {
  const name = 'react';
  const style = {
    backgroundColor: 'black',
    color: 'aqua',
    fontSize: 24, // 기본 단위 px
    padding: '1rem' // 다른 단위 사용 시 문자열로 설정
  }

  return (
    <>
      <InputSample />
      <Counter />
      {/* 주석은 화면에 보이지 않습니다 */}
      /* 중괄호로 감싸지 않으면 화면에 보입니다 */
      {/* props 전달 : 일종의 파라미터라고 보면 될 것 같다. */}
      <Wrapper>
      {/* true는 자바스크립트 값이라서 {}로 감싸준다. */}
      {/* isSpecial 값을 지정하지 않을 경우 true로 취급된다. */}
      <Hello name = "react" color = "red" isSpecial={true}
        // 열리는 태그 내부에서는 이렇게 주석을 작성 할 수 있습니다.
      />
      <div style={style}>{name}</div>
      <Hello color="pink"/>
      </Wrapper>
      <div className="gray-box"></div>
    </>
  );
}

export default App;
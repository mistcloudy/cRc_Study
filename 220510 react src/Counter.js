// 리액트 패키지에서 useState라는 함수를 불러와준다.
import React, { useState } from 'react';

//action은 업데이트를 위한 정보를 가지고 있다.
function reducer (state, action) {
    //새로운 상태를 만드는 로직
    //const nextState = ...

    switch (action.type) {
        case 'INCREMENT':
            return state + 1;
        case 'DECREMENT':
            return state - 1;
        default:
            return state;
    }

    return nextState;
    //반환하는 상태는 곧 컴포넌트가 지닐 새로운 상태
}

function Counter () {
    // useState를 사용할 때에는 상태의 기본값을 파라미터로 넣어서 호출해준다.
    // 배열이 반환되며, 첫 번째 원소는 현재 상태, 두 번째 원소는 Setter 함수이다.
    const [number, setNumber] = useState(0);

    const onIncrease = () => {
        // 기존 값을 어떻게 업데이트할 지에 대한 함수를 등록할 수도 있다. 
        console.log('+1');
        setNumber(prevNumber => prevNumber + 1);
    }
    const onDecrease = () => {
        console.log('-1');
        setNumber(prevNumber => prevNumber - 1);
    }
    return (
        <div>
            <h1>{number}</h1>
            <button onClick={onIncrease}>+1</button>
            <button onClick={onDecrease}>-1</button>
        </div>
    );
}


export default Counter;
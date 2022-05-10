// 컴포넌트 작성
// 리액트 사용을 위해 임포트
import React from 'react'

// 컴포넌트의 동작을 정의하는 함수 작성
function Wrapper ({children}) {
    // style 이라는 객체에 key, value 형태로 작성
    const style = {
        border: '2px solid black',
        padding: '16px',
    };
    // JSX 형태로 반환
    return (
        <div style={style}>
            {/* 내부의 내용을 보여지게 하기 위해서 props.children을 렌더링해준다. */}
            {children}

        </div>
    )
}
// 이 컴포넌트를 Wrapper라는 이름으로 사용하라.
export default Wrapper;
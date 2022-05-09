import React from "react";
// 리액트 컴포넌트를 만들 땐 위 명령문으로 임포트 해주어야만 한다.
// 함수형태, 클래스형태로도 작성 가능하다.
// XML 형식의 값을 반환해줄 수 있고 이를 JSX라고 부른다. 

// props 전달 : 구조분해를 이용한다.
function Hello({color, name, isSpecial}){
    // 삼항연산자 사용. true면 앞의 값 * 을, false면 뒤의 값 null 을 출력,
    // JSX에서 null, undefined, false을 렌더링하면 아무것도 나타나지 않는다.
    // return <div style={{color}}>{isSpecial ? <b>*</b> : null}안녕하세요. {name}</div>
    return <div style={{color}}>{isSpecial && <b>*</b>}안녕하세요. {name}</div>
}

// 컴포넌트에 props를 지정하지 않았을 때, 기본적으로 사용할 값
Hello.defaultProps = {
    name : '이름없음'
}

// 이 코드는 Hello라는 컴포넌트를 내보내겠다는 의미. 다른 컴포넌트에서도 사용 가능해진다.
export default Hello;  
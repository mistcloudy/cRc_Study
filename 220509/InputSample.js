import React, {useState} from 'react';

function InputSample(){
    const [inputs, setInputs] = useState({
        name: '',
        nickname:''
    });

    //비구조화 할당을 통해 값 추출
    const {name, nickname} = inputs;

    const onChange = (e) => {
        // setText(e.target.value);
        const {value, name} = e.target; // 우선 e.target에서 name과 value를 추출
        setInputs({
            ...inputs, //기존의 input 객체를 복사(spread)한 뒤
            [name]: value //name 키를 가진 값을 value로 설정
            //이러한 작업을 '불변성을 지킨다' 라고 하는데, 이래야만 리액트 컴포넌트에서
            //상태가 업데이트 되었음을 감지할 수 있고 이에 따라 필요한 렌더링이 진행된다.
            //직접 수정하게되면 값을 바꿔도 리렌더링이 되지 않는다.
            //추가적으로, 리액트에서는 불변성을 지켜주어야만 컴포넌트 업데이트 성능 최적화를
            //제대로 할 수 있다.
        });
    };

    const onReset = () => {
            // setText('');
            setInputs({
                name : '',
                nickname : ''
            });
    };
    return (
        <div>
            {/* <input onChange={onChange} value={text}/> */}
            <input name="name" placeholder="이름" onChange={onChange} value={name}/>
            <input name="nickname" placeholder="닉네임" onChange={onChange} value={nickname}/>
            <button onClick={onReset}>초기화</button>
            <div>
                {/* <b>값: {text}</b> */}
                <b>값: </b>
                {name} ({nickname})
                </div>
        </div>
    );
}

export default InputSample;
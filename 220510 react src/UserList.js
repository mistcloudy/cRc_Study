import React, { useEffect } from "react";

function User({user, onRemove, onToggle}){
    useEffect( () => {
        console.log(user);

        // console.log('user 값이 설정됨');
        // console.log(user);
        // // console.log('컴포넌트가 화면에 나타남');
        // return  () => {
        //     // console.log('컴포넌트가 화면에서 사라짐');
        //         console.log('user 가 바뀌기 전..');
        //         console.log(user);
        // };
    // }, [user]
    });
    return (
        <div>
            <b style={{
                cursor: 'pointer',
                color: user.active ? 'green' : 'black'
            }}
            onClick={() => onToggle(user.id)}
            >
                {user.username}
            </b>
            &nbsp;
            <span>({user.email})</span>
            <button onClick={() => onRemove(user.id)}>삭제</button>
        </div>
    );
}

function UserList ({users, onRemove, onToggle}){
    return(
        <div>
            {users.map(user => (
                <User 
                user={user} 
                key={users.id} 
                onRemove={onRemove}
                onToggle={onToggle}
                />
            ))}
        </div>
    );
    // return (
    //     <div>
    //         <User user={users[0]} />
    //         <User user={users[1]} />
    //         <User user={users[2]} />
    //     </div>
    // );
    // return (
    //     <div>
    //         <div>
    //             <b>{users[0].username}</b> <span>({users[0].email})</span>
    //         </div>
    //         <div>
    //             <b>{users[1].username}</b> <span>({users[1].email})</span>
    //         </div>
    //         <div>
    //             <b>{users[2].username}</b> <span>({users[2].email})</span>
    //         </div>  
    //     </div>
    // );
}

export default React.memo(
    UserList,
    // 특정 값들만 비교하기
    (prevProps, nextProps) => prevProps.users === nextProps.users
    );
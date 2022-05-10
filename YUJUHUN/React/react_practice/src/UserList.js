import React, {useEffect} from 'react';

const User = React.memo(function User({user, onRemove, onToggle}) {
    useEffect(() => {
        console.log ('Setted user value');
        console.log(user);
        return () => {
            console.log('Before user set..');
            console.log(user);
        };
    }, [user]);
    return (
        <div>
            <b style={{
                cursor: 'pointer',
                color: user.active ? 'green' : 'black'
            }} 
            onClick={() => onToggle(user.id)}>
            {user.username}
            </b> 
            &nbsp;
            <span>({user.email})</span>
            <button onClick={() => onRemove(user.id)}>Delete</button>
        </div>
    );
});

function UserList({users, onRemove, onToggle}) {
    return (
        <div>
           {users.map(user => (
               <User user={user} key={user.id} onRemove={onRemove} onToggle={onToggle}/> // key={index}
           ))}
        </div>
    );
}

export default React.memo(UserList);
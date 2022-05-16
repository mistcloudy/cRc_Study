import React, {useRef, useState, useMemo, useCallback} from 'react';
import Hello from './Hello';
import Wrapper from './Wrapper';
import Counter from './Counter';
import './App.css' // css + className
import InputSample from './InputSample';
import UserList from './UserList';
import CreateUser from './CreateUser';
import Counter2 from './Counter2';
import useInputs from './hooks/useinputs';
import produce from 'immer';


function countActiveUsers(users) {
  console.log('counting actives users...');
  return users.filter(user => user.active).length;
}

export const UserDispatch = React.createContext(null);

function App() {
    const [{username, email}, onChange, reset] = useInputs({
      username: '',
      email: ''
    });
    const [users, setUsers] = useState([
        {
            id : 1,
            username : 'yujuhun',
            email : 'yujuhun@mail.com',
            active : true
        },
        {
            id : 2,
            username : 'tester',
            email : 'tester@test.com',
            active : false
        },
        {
            id : 3,
            username : 'cRc',
            email : 'cRc@jp.com',
            active : false
        }
    ]);
    const nextId = useRef(4);
    const onCreate = useCallback(() => {
      const user = {
        id : nextId.current,
        username,
        email
      };
      setUsers( produce (draft =>{
        draft.push(user)
      })); // setUsers(users.concat(user));
      // spread - copy array, concat - new array // immer = push array
      reset();
  nextId.current += 1;
    }, [ username, email, reset]);

    const onRemove = useCallback(
      id => {
      setUsers( produce (draft => {
        const index = draft.findIndex(user => user.id === id);
        draft.splice(index, 1); // immer 
      }));
    }, []);

    const onToggle = useCallback(
      id => {
      setUsers( produce(draft => {
        const user = draft.find(user => user.id === id);
        user.active = !user.active;
      })); // immer
      
    }, []);

    const count = useMemo(() => countActiveUsers(users), [users]) ; 
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
      <br></br>
      <Counter />
      <br></br>
      <InputSample />
      <br></br>
      <CreateUser
        username={username}
        email={email}
        onChange={onChange}
        onCreate={onCreate}
      />
      <UserList users ={users} onRemove={onRemove} onToggle={onToggle} />
      <div>Actives users Number : {count}</div>
      <br></br>
      <Counter2 />
    </Wrapper> 
  );
} 

export default App;

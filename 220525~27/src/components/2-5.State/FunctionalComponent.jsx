import React, { useEffect, useState} from 'react'

export default function FunctionalComponent() {
    const [date, setDate] = useState(new Date());

    const tick = () => {
        setDate(new Date());
    }

    // 빈 배열을 주면 마운트 되자마자 호출된다
    useEffect( () => {
        const interval = setInterval(() => tick(), 1000);

        return () => {
            clearInterval(interval);
        };
    }, [])

    return (
        <div>
          <h1>Hello, world!</h1>
          <h2>It is {date.toLocaleTimeString()}.</h2>
        </div>
      );
}
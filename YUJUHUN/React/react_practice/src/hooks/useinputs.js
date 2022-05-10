import { useState, useCallback } from "react";

function useInputs(initinput) {
    const [input, setInputs] = useState(initinput);
      
      const onChange = useCallback(
         e => {
        const {name, value} = e.target;
        setInputs(input => ({
          ...input,
          [name]: value
        }));
      }, []);

      const reset = useCallback(() => setInputs(initinput), [initinput]);
      
      return [input, onChange, reset];
}

export default useInputs;
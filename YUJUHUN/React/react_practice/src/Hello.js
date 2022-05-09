import React from 'react';

function Hello({color, name, isSpecial}) {
    return <div style={{color}}>
        { isSpecial && <b>***</b>} {/* Conditional Rendering  */}
        Hello {name}
        </div>
} // unstructured assignment for multies props

Hello.defaultProps = {
    name : 'noName'
} // defaultProps

export default Hello;
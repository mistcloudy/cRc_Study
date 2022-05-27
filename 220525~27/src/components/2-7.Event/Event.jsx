import React from 'react'

export default function Event() {

    const handleButtonClick = () => {
        console.log('handleButtonClick')
    }

    const handleClickCapture = () => {
        console.log('handleClickCapture')
    }

    const handleClickCapture2 = () => {
        console.log('handleClickCapture2')
    }

    const handleClickBubble = () => {
        console.log('handleClickBubble')
    }

    const handleMouseLeave = () => {
        console.log('handleMouseLeave')
    }
  return (
    <div onClickCapture={handleClickCapture}>
        <div onClickCapture={handleClickCapture2} onClick={handleClickBubble}>
            <button onClick={handleButtonClick} onMouseLeave={handleMouseLeave}>Button</button>
        </div>
    </div>
  )
}

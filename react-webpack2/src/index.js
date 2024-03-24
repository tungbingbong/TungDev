import React from 'react' // nạp thư viện react
import ReactDOM from 'react-dom/client' // nạp thư viện react-dom

// Tạo component App
function App() {
    return (
        <div>
            <h1>What'up every body man F8 bruh!!!</h1>
        </div>
    )
}

// Render component App vào #root element
// React@17
// ReactDOM.render(<App />, document.getElementById('root'))
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);


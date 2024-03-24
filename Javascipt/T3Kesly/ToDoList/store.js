import { createStore } from './core.js'
import reducer from './reducer.js'
import withLogger from './logger.js'

const { attach, connect, dispatch } = createStore(withLogger(reducer))
// creat Store nhận vào 1 hàm mà hàm đó trả về 1 state mới

window.dispatch = dispatch

export {
    attach,
    connect,
}
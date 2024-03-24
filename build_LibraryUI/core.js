export default function html([first, ...strings], ...values) {
    return values.reduce(
            (acc, cur) => acc.concat(cur, strings.shift()), [first]
        )
        .filter(x => x && x !== true || x === 0)
        .join('');
}

export function createStore(reducer) {
    let state = reducer()
    const roots = new Map()

    function render() {
        for (const [root, component] of roots) {
            const output = component(root, state)
            root.innerHTML = output
        }
    }

    return {
        // Receive view và đẩy ra roots
        attach(component, root) {
            roots.set(root, component)
            render()
        },
        // Đẩy data từ store rồi display thị ra view
        connect(selector = state => state) {
            return component => (props, ...args) =>
                component(Object.assign({}, props, selector(state), ...args))
        },
        // Thực thi hành động thông qua mô tả của view
        dispatch(action, ...args) {
            state = reducer(state, action, args)
            render();
        }
    }
}
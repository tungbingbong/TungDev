//Toast function
function toast({ title = "", message = "", type = "", duration = 3000 }) {

    const main = document.getElementById('toast');

    if (main) {
        const toast = document.createElement('div');
        //auto removed toast
        const autoRemoveId = setTimeout(() => {
            main.removeChild(toast);
        }, duration + 1000)

        //removed toast when click
        toast.onclick = function(e) {
            if (e.target.closest('.toast__close')) {
                main.removeChild(toast);
                clearTimeout(autoRemoveId);
            }
        }

        const icons = {
            success: "fa-solid fa-check",
            info: "fa-solid fa-circle-info",
            warning: "fa-solid fa-exclamation",
            error: "fa-solid fa-exclamation"
        };

        const delay = (duration / 1000).toFixed(2);

        const icon = icons[type];
        toast.classList.add("toast", `toast--${type}`);
        toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;
        toast.innerHTML = `
            <div class="toast__icon">
                <i class="${icon}"></i>
            </div>
            <div class="toast__body">
                <h3 class="toast__title">${title}</h3>
                <p class="toast__message">${message}</p>
            </div>
            <div class="toast__close">
                <i class="fa-solid fa-xmark"></i>
            </div>
        `;
        main.appendChild(toast);

    }
}
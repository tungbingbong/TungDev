const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const tabs = $$('.tab-item');
const panes = $$('.tab-pane');

const tabActive = $('.tab-item.active');
const line = $('.tabs .line');



requestIdCallback(function() {
    line.style.left = tabActive.offsetLeft + 'px';
    line.style.width = tabActive.offsetWidth + 'px';
});


tabs.forEach((tab, index) => {


    tab.onclick = () => {
        //pane index equivalent to tab index so we can do like that
        const pane = panes[index];
        //remove element that current has active content
        $('.tab-item.active').classList.remove('active');
        $('.tab-pane.active').classList.remove('active');

        //When click on the tab, the line red below will be highlight
        line.style.left = tab.offsetLeft + 'px';
        line.style.width = tab.offsetWidth + 'px';

        //add active to element if user click
        tab.classList.add('active');
        pane.classList.add('active');



    }
})
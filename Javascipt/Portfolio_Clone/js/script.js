/* Show menu burger */
const menuburger = document.querySelector(".nav__menu-btn");
const overlay = document.querySelector(".overlay");
const menumobile = document.querySelector(".nav__mobile");
menuburger.addEventListener("click", function () {
    menuburger.classList.toggle("open");
    overlay.classList.toggle("show");
    menumobile.classList.toggle("show");
})
overlay.addEventListener("click", function () {
    menuburger.classList.toggle("open");
    overlay.classList.toggle("show");
    menumobile.classList.toggle("show");

})
/* add & remove class active */
const activemenu = document.querySelectorAll(".nav__link");

const blogshow = document.querySelector(".show-blog");
const pageshow = document.querySelector(".show-pages");
const list_blog = document.querySelector(".list-blogs");
const list_pages = document.querySelector(".list-pages");
const page2show = document.querySelector(".show-pages2");
const list_pages2 = document.querySelector(".list-pages2");

function linkActive() {
    activemenu.forEach(n => n.classList.remove("active"));
    this.classList.add("active");
    menumobile.classList.remove("show");
    overlay.classList.remove("show");
    if (!overlay.classList.contains("show")) {
        if (blogshow.classList.contains('fa-chevron-up')) {
            blogshow.classList.add("fa-chevron-down");
            blogshow.classList.remove("fa-chevron-up");
            list_blog.classList.toggle("active");
        }
        if (pageshow.classList.contains('fa-chevron-up')) {
            pageshow.classList.add("fa-chevron-down");
            pageshow.classList.remove("fa-chevron-up");
            list_pages.classList.toggle("active");
        }
        if (page2show.classList.contains('fa-chevron-up')) {
            page2show.classList.add("fa-chevron-down");
            page2show.classList.remove("fa-chevron-up");
            list_pages2.classList.toggle("active");
        }
    }
    menuburger.classList.remove("open");
}
activemenu.forEach(n => n.addEventListener("click", linkActive));
/* show ul__list menu */
blogshow.addEventListener("click", function () {
    blogshow.classList.toggle("fa-chevron-down");
    blogshow.classList.toggle("fa-chevron-up");
    list_blog.classList.toggle("active");
})

pageshow.addEventListener("click", function () {
    pageshow.classList.toggle("fa-chevron-down");
    pageshow.classList.toggle("fa-chevron-up");
    list_pages.classList.toggle("active");
})
page2show.addEventListener("click", function () {
    page2show.classList.toggle("fa-chevron-down");
    page2show.classList.toggle("fa-chevron-up");
    list_pages2.classList.toggle("active");
})

const blogdk = document.querySelector(".list-dk-blog");
const navitemblog = document.querySelector(".nav__item--blog");
const navitempages = document.querySelector(".nav__item--pages");
const pagesdk = document.querySelector(".list-dk-pages");
navitemblog.addEventListener("mouseover", function () {
    blogdk.style.display = "block";
    pagesdk.style.display = "none";

})
navitemblog.addEventListener("mouseleave", function () {
    blogdk.style.display = "none";
})
navitempages.addEventListener("mouseover", function () {
    pagesdk.style.display = "block";
    blogdk.style.display = "none";
})
navitempages.addEventListener("mouseleave", function () {
    pagesdk.style.display = "none";
})


$(document).ready(function () {
    /* Counter Up */
    $(".fact__number").counterUp({
        delay: 10,
        time: 1000
    });
    /* Scroll Y */
    $(window).scroll(function () {
        if ($("body,html").scrollTop() > 150) {
            $(".nav").addClass("fixed");
        }
        else {
            $(".nav").removeClass("fixed");
        }
        if ($("body,html").scrollTop() > 400) {
            $(".lendautrang").addClass("show");
        }
        else {
            $(".lendautrang").removeClass("show");
        }
    });
    /* back to top */
    $(".lendautrang").on("click", function () {
        $("body,html").scrollTop(0, 400);
    });
    /* filter image */
    $(".list__filter").on("click", function () {
        const value = $(this).attr("data-filter");
        if (value == "All") {
            $(".portfolio__item").show("1000");
        } else {
            $(".portfolio__item").not("." + value).hide("1000");
            $(".portfolio__item").filter("." + value).show("1000");
        }
        $(".list__filter").removeClass("active");
        $(this).addClass("active");
    })

})

/* carousel */
$('#slider').owlCarousel({
    loop: true,
    margin: 10,
    nav: false,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1,
            nav: false
        },
        768: {
            items: 2,
            nav: false
        }
    }
})
$(".owl-dot").on("click", function () {
    $(".owl-dot").removeClass("active");
})
$('#slider2').owlCarousel({
    loop: true,
    margin: 10,
    nav: false,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: false,
    responsive: {
        0: {
            items: 1,
            nav: false
        },
        768: {
            items: 3,
            nav: false
        },
        1000: {
            items: 5,
            nav: false
        }
    }
})





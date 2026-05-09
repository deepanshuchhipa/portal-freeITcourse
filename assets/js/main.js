
/*========================
Table of Content
==========================
    01 Preloader
    02 Back To Top
    03 AOS Init
    04 Sticky Header
    05 Offcanvas Menu
    06 Mobile Menu
    07 Scroll Smoother
    08 GLightbox
    09 GSAP Text Animation Style One
    10 GSAP Text Animation Style Two
    11 Paragraph Text Style
    12 GSAP Parallax Move Left
    13 GSAP Parallax Move Right
    14 Reveal to Right Animation
    15 Reveal to Left Animation
    16 Reveal to Top Animation
    17 Reveal to Bottom Animation
    18 simpleParallax js down
    19 simpleParallax js up
    20 simpleParallax js left
    21 impleParallax js right
    22 Service slider one
    23 Blog slider one
    24 Testimonial slider one
    25 Testimonial slider two
    26 Testimonial slider four
    27 Project four slider
    28 Marquee left
    29 Marquee Right
    30 Odometer
    31 faq accordion
===========================
Table of content
============================*/

(function ($) {
    'use strict';

    if (typeof gsap !== "undefined" && typeof ScrollTrigger !== "undefined") {
        gsap.registerPlugin(ScrollTrigger);
    }
    if (typeof ScrollSmoother !== "undefined") {
        gsap.registerPlugin(ScrollSmoother);
    }
    if (typeof SplitText !== "undefined") {
        gsap.registerPlugin(SplitText);
    }

    /*===== 01 Preloader =====*/
    function loader() {
        $(window).on("load", function () {
            // Animate loader off screen
            $(".preloader").addClass("loaded");
            $(".preloader").delay(600).fadeOut();
        });
    }
    loader();

    /*===== 02 Back To Top =====*/
    if ($(".cloudflow-progress-circle path").length && !window.clinifyxProgressInitialized) {
        window.clinifyxProgressInitialized = true;

        var $progressPath = $(".cloudflow-progress-circle path");
        var pathLength = $progressPath[0].getTotalLength();

        $progressPath.css({
            strokeDasharray: pathLength,
            strokeDashoffset: pathLength,
        });

        $(window).on("scroll.clinifyxProgress", function () {
            var scroll = $(window).scrollTop();
            var height = $(document).height() - $(window).height();
            var progress = pathLength - (scroll * pathLength) / height;
            $progressPath.css("strokeDashoffset", progress);

            if (scroll > 200) {
                $(".cloudflow-progress-wrap").addClass("active");
            } else {
                $(".cloudflow-progress-wrap").removeClass("active");
            }
        });

        $(".cloudflow-progress-wrap").on("click.clinifyxProgress", function (e) {
            e.preventDefault();
            $("html, body").animate({ scrollTop: 0 }, 600);
        });
    }

    /*====== 03 AOS Init ======*/
    $(window).on('load', function () {
        AOS.init({
            once: true,
            offset: 120,
            duration: 900,
            easing: 'ease-out-cubic',
        });
    });


    /* ===== Document Ready ===== */
    $(document).ready(function () {

        /*===== 04 Sticky Header =====*/
        if ($('.stricky').length) {
            $('.stricky').addClass('original').clone(true).insertAfter('.stricky').addClass('stricked-menu').removeClass('original');
        }
        $(window).on('scroll', function () {
            if ($('.stricked-menu').length) {
                var headerScrollPos = 100;
                var stricky = $('.stricked-menu');
                if ($(window).scrollTop() > headerScrollPos) {
                    stricky.addClass('stricky-fixed');
                } else if ($(this).scrollTop() <= headerScrollPos) {
                    stricky.removeClass('stricky-fixed');
                }
            }
        });

        /*===== 05 Offcanvas Menu =====*/
        $('.sidebar-menu-close, .body-overlay').on('click', function () {
            $('.offcanvas-sidebar').removeClass('active');
            $('.body-overlay').removeClass('active');
        });

        $('.offcanvas-sidebar-btn').on('click', function () {
            $('.offcanvas-sidebar').addClass('active');
            $('.body-overlay').addClass('active');
        });

        $('.body-overlay').on('click', function () {
            $(this).removeClass('active');
            $(".header-search-form-wrapper").removeClass("open");
        });

        /*===== 06 Mobile Menu =====*/
        $('.ixl-nav-hidden li.menu-item-has-children > a').append('<span class="ixl-menu-toggle"></span>');
        $('.ixl-header-menu li.menu-item-has-children, .ixl-menu-primary li.menu-item-has-children').append('<span class="ixl-menu-toggle"></span>');
        $('.ixl-menu-toggle').on('click', function () {
            if (!$(this).hasClass('active')) {
                $(this).closest('ul').find('.ixl-menu-toggle.active').toggleClass('active');
                $(this).closest('ul').find('.sub-menu.active').toggleClass('active').slideToggle();
            }
            $(this).toggleClass('active');
            $(this).closest('.menu-item').find('> .sub-menu').toggleClass('active');
            $(this).closest('.menu-item').find('> .sub-menu').slideToggle();
        });

        $('.ixl-nav-hidden li.menu-item-has-children > a').click(function (e) {
            var target = $(e.target);
            if ($(this).attr('href') === '#' && !(target.is('.ixl-menu-toggle'))) {
                e.stopPropagation();
                if (!$(this).find('.ixl-menu-toggle').hasClass('active')) {
                    $(this).closest('ul').find('.ixl-menu-toggle.active').toggleClass('active');
                    $(this).closest('ul').find('.sub-menu.active').toggleClass('active').slideToggle();
                }
                $(this).find('.ixl-menu-toggle').toggleClass('active');
                $(this).closest('.menu-item').find('> .sub-menu').toggleClass('active');
                $(this).closest('.menu-item').find('> .sub-menu').slideToggle();
            }
        });
        $(".ixl-nav-mobile").on('click', function () {
            $(this).toggleClass('active');
            $('.ixl-header-menu').toggleClass('active');
        });

        $(".ixl-menu-close, .ixl-header-menu-backdrop").on('click', function () {
            $(this).removeClass('active');
            $('.ixl-header-menu').removeClass('active');
        });

        /*====== 07 Scroll Smoother======*/
        const smoother = ScrollSmoother.create({
            wrapper: "#ixl-smooth-wrapper",
            content: "#ixl-smooth-content",
            smooth: 1.2,
            smoothTouch: 0.15,
            normalizeScroll: true,
            effects: true
        });

        /*===== 08 GLightbox =====*/
        const lightbox = GLightbox({
            selector: '.ixl-glightbox',
            videoAutoplay: false
        });

    });

    /* ===== gsap text animations  =====*/
    function initSplitTextAnimations() {

        /*====== 09 GSAP Text Animation Style One ======*/
        if ($('.text-anime-style-1').length) {
            let staggerAmount = 0.05,
                delayValue = 0.5,
                animatedTextElements = document.querySelectorAll('.text-anime-style-1');

            animatedTextElements.forEach((element) => {
                let split = new SplitText(element, { type: "chars, words" });

                gsap.from(split.words, {
                    duration: 1,
                    delay: delayValue,
                    x: 20,
                    autoAlpha: 0,
                    stagger: staggerAmount,
                    scrollTrigger: {
                        trigger: element,
                        start: "top 85%"
                    }
                });
            });
        }

        /*====== 10 GSAP Text Animation Style Two ======*/
        if ($('.text-anime-style-2').length) {
            document.querySelectorAll('.text-anime-style-2').forEach((element) => {

                if (element.animation) {
                    element.animation.progress(1).kill();
                    element.split.revert();
                }

                element.split = new SplitText(element, {
                    type: "lines,words,chars",
                    linesClass: "split-line",
                });

                gsap.set(element, { perspective: 400 });
                gsap.set(element.split.chars, { opacity: 0, x: 50 });

                element.animation = gsap.to(element.split.chars, {
                    scrollTrigger: {
                        trigger: element,
                        start: "top 90%"
                    },
                    x: 0,
                    opacity: 1,
                    duration: 1,
                    ease: "back.out(1.7)",
                    stagger: 0.02
                });
            });
        }

        /*====== 11 Paragraph Text Style ======*/
        if ($(".para-split-text").length) {
            $(".para-split-text").each(function () {

                let split = new SplitText(this, {
                    type: "lines, words"
                });

                gsap.from(split.lines, {
                    y: 50,
                    opacity: 0,
                    duration: 1.5,
                    ease: "power4.out",
                    stagger: 0.03,
                    scrollTrigger: {
                        trigger: this,
                        start: "top 85%",
                        once: true
                    }
                });
            });
        }
    }

    $(window).on("load", function () {
        document.fonts.ready.then(() => {
            initSplitTextAnimations();
        });
    });

    /*===== 12 GSAP Parallax Move Left =====*/
    gsap.utils.toArray('.parallax-move-left').forEach((el) => {
        gsap.fromTo(
            el,
            { x: "-20%", scale: 0.5 },
            {
                x: "20%",
                scale: 1.1,
                ease: "none",
                scrollTrigger: {
                    trigger: el,
                    start: "top 90%",
                    end: "top 50%",
                    scrub: 1.5
                }
            }
        );
    });

    /*===== 13 GSAP Parallax Move Right =====*/
    gsap.utils.toArray('.parallax-move-right').forEach((el) => {
        gsap.fromTo(
            el,
            { x: "20%", scale: 0.5 },
            {
                x: "-20%",
                scale: 1.1,
                ease: "none",
                scrollTrigger: {
                    trigger: el,
                    start: "top 90%",
                    end: "top 50%",
                    scrub: 1.5
                }
            }
        );
    });

    /*===== 14 Reveal to Right Animation =====*/
    function cloudeflowRevealRightAnimation() {
        if ($(".ixl-reveal-right").length) {
            $(".ixl-reveal-right").each(function () {
                const container = this;
                const image = $(container).find("img").get(0);
                if (!image) return;

                const tl = gsap.timeline({
                    scrollTrigger: {
                        trigger: container,
                        toggleActions: "play none none none",
                    },
                });

                tl.set(container, { autoAlpha: 1 });
                tl.from(container, {
                    duration: 1.5,
                    xPercent: 100,
                    ease: Power2.in,
                });
                tl.from(image, {
                    duration: 1.5,
                    xPercent: -100,
                    scale: 1.3,
                    delay: -1.5,
                    ease: Power2.in,
                });
            });
        }
    }
    cloudeflowRevealRightAnimation();

    //*===== 15 Reveal to Left Animation =====*/
    function cloudeflowRevealLeftAnimation() {
        if ($(".ixl-reveal-left").length) {
            $(".ixl-reveal-left").each(function () {
                const container = this;
                const image = $(container).find("img").get(0);
                if (!image) return;

                const tl = gsap.timeline({
                    scrollTrigger: {
                        trigger: container,
                        toggleActions: "play none none none",
                    },
                });

                tl.set(container, { autoAlpha: 1 });
                tl.from(container, {
                    duration: 1.5,
                    xPercent: -100,
                    ease: Power2.out,
                });
                tl.from(image, {
                    duration: 1.5,
                    xPercent: 100,
                    scale: 1.3,
                    delay: -1.5,
                    ease: Power2.out,
                });
            });
        }
    }
    cloudeflowRevealLeftAnimation();

    /*===== 16 Reveal to Top Animation =====*/
    function cloudeflowRevealTopAnimation() {
        if ($(".ixl-reveal-top").length) {
            $(".ixl-reveal-top").each(function () {
                const container = this;
                const image = $(container).find("img").get(0);
                if (!image) return;

                const tl = gsap.timeline({
                    scrollTrigger: {
                        trigger: container,
                        toggleActions: "play none none none",
                    },
                });

                tl.set(container, { autoAlpha: 1 });
                tl.from(container, {
                    duration: 1.5,
                    yPercent: 100,
                    ease: Power2.in,
                });
                tl.from(image, {
                    duration: 1.5,
                    yPercent: -100,
                    scale: 1.3,
                    delay: -1.5,
                    ease: Power2.in,
                });
            });
        }
    }
    cloudeflowRevealTopAnimation();

    /*===== 17 Reveal to Bottom Animation =====*/
    function cloudeflowRevealBottomAnimation() {
        if ($(".ixl-reveal-bottom").length) {
            $(".ixl-reveal-bottom").each(function () {
                const container = this;
                const image = $(container).find("img").get(0);
                if (!image) return;

                const tl = gsap.timeline({
                    scrollTrigger: {
                        trigger: container,
                        toggleActions: "play none none none",
                    },
                });

                tl.set(container, { autoAlpha: 1 });
                tl.from(container, {
                    duration: 1.5,
                    yPercent: -100,
                    ease: Power2.in,
                });
                tl.from(image, {
                    duration: 1.5,
                    yPercent: 100,
                    scale: 1.3,
                    delay: -1.5,
                    ease: Power2.in,
                });
            });
        }
    }
    cloudeflowRevealBottomAnimation();

    /*===== 18 simpleParallax js down =====*/
    const downImages = document.querySelectorAll('.parallax-img-down');
    new simpleParallax(downImages, {
        scale: 1.5,
        delay: 0.5,
        orientation: 'down'
    });

    /*===== 19 simpleParallax js up =====*/
    const upImages = document.querySelectorAll('.parallax-img-up');
    new simpleParallax(upImages, {
        scale: 1.5,
        delay: 0.5,
        orientation: 'up'
    });

    /*===== 20 simpleParallax js left =====*/
    const leftImages = document.querySelectorAll('.parallax-img-left');
    new simpleParallax(leftImages, {
        scale: 1.5,
        delay: 0.5,
        orientation: 'left'
    });

    /*===== 21 impleParallax js right =====*/
    const rightImages = document.querySelectorAll('.parallax-img-right');
    new simpleParallax(rightImages, {
        scale: 1.5,
        delay: 0.5,
        orientation: 'right'
    });

    /*===== 22 Service slider one =====*/
    if ($('.service-slider-one').length > 0) {
        let serviceSliderOne = new Swiper(".service-slider-one", {
            spaceBetween: 24,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                575: {
                    slidesPerView: 1,
                },
                767: {
                    slidesPerView: 2,
                },
                991: {
                    slidesPerView: 3,
                },
                1199: {
                    slidesPerView: 4,
                },
            },

        });
    };

    /*===== 23 Blog slider one =====*/
    if ($('.blog-slider-one').length > 0) {
        let blogSliderOne = new Swiper(".blog-slider-one", {
            spaceBetween: 24,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                575: {
                    slidesPerView: 1,
                },
                767: {
                    slidesPerView: 2,
                },
                1199: {
                    slidesPerView: 3,
                },
            },
        });

    };

    /*===== 24 Testimonial slider one =====*/
    if ($('.testimonial-slider-one').length > 0) {
        let testimonialSliderOne = new Swiper(".testimonial-slider-one", {
            slidesPerView: 1,
            spaceBetween: 0,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    };

    /*===== 25 Testimonial slider two =====*/
    if ($('.ixl-testimonial-slider-two').length > 0) {
        let testimonialSliderTwo = new Swiper(".ixl-testimonial-slider-two", {
            slidesPerView: 1,
            spaceBetween: 0,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    };

    /*===== 26 Testimonial slider four =====*/
    if ($('.testimonial-four-slider').length > 0) {
        let testimonialSliderFour = new Swiper(".testimonial-four-slider", {
            slidesPerView: 1,
            spaceBetween: 0,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    };

    /*===== 27 Project four slider =====*/
    if ($('.project-four-slider').length > 0) {
        let projectSliderTwo = new Swiper(".project-four-slider", {
            // slidesPerView: 1,
            spaceBetween: 24,
            breakpoints: {
                575: {
                    slidesPerView: 1,
                },
                767: {
                    slidesPerView: 2,
                },
                1199: {
                    slidesPerView: 4,
                },
            },
        });
    };

    /*===== 28 Marquee left =====*/
    if ($('.marquee-left').length) {
        $('.marquee-left').marquee({
            duration: 20000,
            gap: 20,
            direction: 'left',
            duplicated: true,
            startVisible: true
        });
    };

    /*===== 29 Marquee Right =====*/
    if ($('.marquee-right').length) {
        $('.marquee-right').marquee({
            duration: 20000,
            gap: 20,
            direction: 'right',
            duplicated: true,
            startVisible: true
        });
    };

    /*===== 30 Odometer =======*/
    if ($(".odometer").length) {
        $('.odometer').appear();

        $(document.body).on('appear', '.odometer', function () {
            var $this = $(this); // only current odometer
            var countNumber = $this.attr("data-count");

            $this.html(countNumber);
        });
    }

    /*===== 31 faq accordion ======*/
    $('.faq-item .heading').on('click', function () {

        let parent = $(this).parent();

        if (parent.hasClass('active')) {
            parent.removeClass('active');
            parent.find('.content').stop().slideUp(300);
        } else {

            $('.faq-item').removeClass('active');
            $('.faq-item .content').stop().slideUp(300);

            parent.addClass('active');
            parent.find('.content').stop().slideDown(300);
        }

    });


})(jQuery);
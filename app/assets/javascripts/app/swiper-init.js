const isMobile = () => {
  var width = window.innerWidth;
  if (width <= 768) {
    return true
  }
}

let slidesView;
let slidesCol;
let perView;

if (isMobile()) {
  slidesView = 1;
  slidesCol = 1;
  perView = 1;
} else {
  slidesView = 3;
  slidesCol = 2;
  perView = 6;
}


var singleCardSwiper = new Swiper ('.swiper-container.swiper-single-card', {
  // Optional parameters
  direction: 'vertical',
  loop: true,

  // If we need pagination
  pagination: '.swiper-pagination-white.swiper-single-card',

  // Navigation arrows
  nextButton: '.swiper-button-next.swiper-single-card',
  prevButton: '.swiper-button-prev.swiper-single-card',

  // And if we need scrollbar
  scrollbar: '.swiper-scrollbar.swiper-single-card',
});

var allCardsSwiper = new Swiper ('.swiper-container.swiper-all-cards', {
  // Optional parameters
  direction: 'horizontal',
  loop: false,
  preventClicks: true,
  keyboardControl: true,
  slidesPerView: slidesView,
  slidesPerColumn: slidesCol,
  slidesPerGroup: perView,
  // If we need pagination
  pagination: '.swiper-pagination.swiper-all-cards',
});

var editSwiper = new Swiper('.swiper-container.swiper-edit', {
  pagination: '.swiper-pagination.swiper-edit',
  slidesPerView: 3,
  paginationClickable: true,
  spaceBetween: 30,
  freeMode: true,
});

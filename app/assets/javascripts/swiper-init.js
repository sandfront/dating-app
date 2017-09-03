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
})

var allCardsSwiper = new Swiper ('.swiper-container.swiper-all-cards', {
  // Optional parameters
  direction: 'horizontal',
  loop: false,
  preventClicks: true,
  keyboardControl: true,

  // If we need pagination
  pagination: '.swiper-pagination.swiper-all-cards',
})

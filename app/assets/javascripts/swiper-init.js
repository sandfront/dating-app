var singleCardSwiper = new Swiper ('.swiper-container-single-card', {
  // Optional parameters
  direction: 'vertical',
  loop: true,

  // If we need pagination
  pagination: '.swiper-pagination',

  // Navigation arrows
  nextButton: '.swiper-button-next',
  prevButton: '.swiper-button-prev',

  // And if we need scrollbar
  scrollbar: '.swiper-scrollbar',
})

var allCardsSwiper = new Swiper ('.swiper-container-all-card', {
  // Optional parameters
  direction: 'horizontal',
  loop: true,

  // If we need pagination
  pagination: '.swiper-pagination',

  // Navigation arrows
  nextButton: '.swiper-button-next',
  prevButton: '.swiper-button-prev',
})

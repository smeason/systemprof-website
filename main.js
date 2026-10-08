document.querySelectorAll(".slideshow-container").forEach((slideshow) => {
    const slides = Array.from(slideshow.querySelectorAll(".slide"));
    const controls = slideshow.querySelectorAll("[data-slide-step]");
    const indicators = slideshow.querySelectorAll("[data-slide-index]");

    if (slides.length === 0) return;

    let activeIndex = 0;

    const showSlide = (index) => {
        activeIndex = (index + slides.length) % slides.length;

        slides.forEach((slide, slideIndex) => {
            slide.hidden = slideIndex !== activeIndex;
        });

        indicators.forEach((indicator, slideIndex) => {
            const isActive = slideIndex === activeIndex;
            indicator.classList.toggle("active", isActive);
            indicator.setAttribute("aria-pressed", String(isActive));
        });
    };

    controls.forEach((control) => {
        control.addEventListener("click", () => {
            showSlide(activeIndex + Number(control.dataset.slideStep));
        });
    });

    indicators.forEach((indicator) => {
        indicator.addEventListener("click", () => {
            showSlide(Number(indicator.dataset.slideIndex));
        });
    });

    showSlide(activeIndex);
});

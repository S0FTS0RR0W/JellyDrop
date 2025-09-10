window.addEventListener('load', () => {
  const splash = document.getElementById('splash-screen');

  const hour = new Date().getHours();
  if (hour >= 18 || hour < 6) {
    splash.classList.add('evening'); 
  }

  // Fade out splash after delay
  setTimeout(() => {
    splash.style.opacity = '0';
    splash.style.transition = 'opacity 1.5s ease';
    setTimeout(() => {
      splash.style.display = 'none';
    }, 1500);
  }, 3000); // Adjust timing to match fadeOut animation
});

// dark mode
document.addEventListener('DOMContentLoaded', () => {
  const toggleButton = document.getElementById('darkNodeToggle');
  const body = document.body;

  // apply saved theme on load
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    body.classList.add('dark-mode');
  }

  // theme toggle logic
  toggleButton.addEventListener('click', () => {
    body.classList.toggle('dark-mode');
    const isDark = body.classList.contains('dark-mode');
    localStorage.setItem('theme', isDark ? 'dark' : 'light');
  });
});

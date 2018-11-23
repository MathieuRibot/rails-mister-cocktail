const searchEngine = () => {
  const form = document.getElementById('search-form');
  form.addEventListener("submit", (event) => {
  event.preventDefault();
  console.log("Here ----------------");
  document.getElementById("comment-form").reset();
  });
};

export { searchEngine };

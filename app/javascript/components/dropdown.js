const categories = document.getElementById('product_category_ids');

function drop() {
  console.log(categories.innerText);
}

categories.addEventListener('click', drop);

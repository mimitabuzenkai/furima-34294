window.addEventListener('load', function(){

  const priceInput = document.querySelector("#item-price");
  const priceTax = document.querySelector("#add-tax-price");
  const profit = document.querySelector("#profit");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    priceTax.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(priceTax)
    profit.innerHTML = (Math.floor(inputValue * 0.9));
    console.log(profit)
     
  });
});

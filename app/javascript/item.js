window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // console.log(inputValue);
    const salesCommission = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit");
    
    salesCommission.innerHTML = (Math.floor(inputValue * 0.1));
    salesProfit.innerHTML =(Math.floor(inputValue * 0.9));

    

})

  // salesCommission.addEventListener("input", () => {
  // console.log("イベント発火");
// })

//   salesProfit.addEventListener("input", () => {
//   console.log("イベント発火");
// })

})
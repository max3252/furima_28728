window.addEventListener('load', function(){

  const sellingPrice = document.getElementById("item-price")
  let tax_price = document.getElementById("add-tax-price")
  let profit_price = document.getElementById("profit")
  

  sellingPrice.addEventListener('change', function(){
    const price = sellingPrice.value
    const tax = Math.floor(price/10);
    console.log(tax);
    const profit = (price - tax); 
    tax_price.innerHTML = tax
    profit_price.innerHTML = profit
  })
  
})
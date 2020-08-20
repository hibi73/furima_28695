window.addEventListener('load', function(){
const item_price = document.getElementById("item-price");
const add_tax_price = document.getElementById("add-tax-price");
const profit = document.getElementById("profit");

item_price.addEventListener('input', function(){
let fee = this.value / 10;
let gain = this.value - fee
add_tax_price.textContent = fee
profit.textContent = gain
})
})



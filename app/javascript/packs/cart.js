var datos = {
    token: document.getElementsByName('csrf-token')[0].content,
    product: null,
    btn: null,
    message: "",
    cart: null,
    status: 0,
    response: null,
    element: null,
    total: null
}
var acciones = {
  addCart(e){
    console.log(e)
  }
}
$(document).ready(function(){
    datos.cart = parseInt(document.getElementById('mycart').textContent)
    if(document.getElementById("my_cart") != null)
      datos.cart_id = document.getElementById("my_cart").getAttribute("cart_id")
})
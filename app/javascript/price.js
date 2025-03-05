const priceCalc = () => {
    const priceInput = document.getElementById("item-price");
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    if (priceInput && taxPrice && profit) {
      priceInput.addEventListener("input", () => {
        const price = parseInt(priceInput.value, 10);

        if (isNaN(price)) {
          taxPrice.textContent = "0";
          profit.textContent = "0";
          return;
        };

        const fee = Math.floor(price * 0.1);   // 販売手数料 (10%)
        const gain = price - fee;               // 販売利益

        taxPrice.textContent = fee.toLocaleString();
        profit.textContent = gain.toLocaleString();
      });
    };
};



document.addEventListener("turbo:load", priceCalc);
document.addEventListener("turbo:render", priceCalc);
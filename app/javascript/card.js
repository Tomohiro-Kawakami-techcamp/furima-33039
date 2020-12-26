const pay = () => {
  Payjp.setPublicKey("pk_test_26af626663e962f9aa0d8149");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_donation[number]"),
      cvc: formData.get("order_donation[cvc]"),
      exp_month: formData.get("order_donation[exp_month]"),
      exp_year: `20${formData.get("order_donation[exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      console.log(response)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log("OK")
      }else{console.log("NG")}

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
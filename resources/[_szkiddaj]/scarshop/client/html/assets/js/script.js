addEventListener("message", (e) => {
  if (e) {
    const data = e.data;

    switch (data.action) {
      case "open_customer":
        Vehicles = data.vehicles;
        List.open(data.vehicles);
        break;

      case "close":
        Main.close();
        $.post("http://scarshop/closeshop", JSON.stringify({}));
        break;

      default:
        break;
    }
  }
});

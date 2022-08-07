let Vehicles = [];
let SelectedVehicle;

const Main = {};

const formatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

Main.open = () => {
  Main.opened = true;

  SelectedVehicle = 0;

  Main.updateVehicle(CachedVehicles[SelectedVehicle], true);

  $("#description").fadeIn(1000);
  $("#controls").fadeIn(1000);
};

Main.close = () => {
  $("#description").fadeOut(1000);
  $("#controls").fadeOut(1000);
};

Main.updateVehicle = (vehicle, updateCam = false) => {
  $("#vehicle-name").text(`${vehicle.manufacturer} ${vehicle.name}`);
  $("#vehicle-price").text(formatter.format(vehicle.price));

  $.post(
    "http://scarshop/updatevehicle",
    JSON.stringify({
      model: vehicle.model,
      loadCam: updateCam,
    })
  );
};

addEventListener("keydown", (e) => {
  if (Main.opened && e.key) {
    switch (e.key) {
      case "ArrowLeft":
        if (!Colorpicker.opened && SelectedVehicle > 0) {
          SelectedVehicle -= 1;
          Main.updateVehicle(CachedVehicles[SelectedVehicle]);
        }

        break;

      case "ArrowRight":
        if (!Colorpicker.opened && SelectedVehicle < CachedVehicles.length - 1) {
          SelectedVehicle += 1;
          Main.updateVehicle(CachedVehicles[SelectedVehicle]);
        }

        break;

      case "c":
        if (!Colorpicker.opened) {
          Colorpicker.open();
        }

        break;

      case "Escape":
        if (!Colorpicker.opened) {
          Main.close();
          $.post("http://scarshop/closeshop", JSON.stringify({}));
        }

        break;

      case "Enter":
        console.log(
          "asd",
          !Colorpicker.opened,
          !isNaN(SelectedVehicle),
          CachedVehicles[SelectedVehicle],
          CachedVehicles[SelectedVehicle].model
        );
        if (
          !Colorpicker.opened &&
          !isNaN(SelectedVehicle) &&
          CachedVehicles[SelectedVehicle] &&
          CachedVehicles[SelectedVehicle].model
        ) {
          console.log("asd2");
          $.post(
            "http://scarshop/buyvehicle",
            JSON.stringify({
              model: CachedVehicles[SelectedVehicle].model,
              color: cachedColor,
            })
          );
        }

        break;
    }
  }
});

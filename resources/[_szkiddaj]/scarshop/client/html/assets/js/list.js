const VehicleCategories = {
  VC_SUV: "SUV",
  VC_SEDAN: "Sedan",
  VC_SPORT_CLASSIC: "Sport classic",
  VC_SPORT: "Sport",
  VC_COMPACTS: "Compact",
  VC_OFF_ROAD: "Offroad",
  VC_VAN: "Furgon",
  VC_MUSCLE: "Izom",
  VC_MOTORCYCLE: "Motor",
};

let CachedVehicles;

const List = {
  opened: false,
};

List.open = (vehicles) => {
  if (vehicles) {
    List.opened = true;

    let addedCategories = {};
    let addedManufacturers = {};

    $("#list-categories").text("");
    $("#list-manufacturers").text("");

    for (let i = 0; i < vehicles.length; i++) {
      const element = vehicles[i];

      if (!addedCategories[element.type] && VehicleCategories[element.type]) {
        addedCategories[element.type] = true;
        $("#list-categories").append(
          `<div class="category" onclick="List.continue('category', '${element.type}')">${
            VehicleCategories[element.type]
          }</div>`
        );
      }

      if (!addedManufacturers[element.manufacturer] && element.manufacturer != "") {
        addedManufacturers[element.manufacturer] = true;
        $("#list-manufacturers").append(
          `<div class="manufacturer" onclick="List.continue('manufacturer', '${element.manufacturer}')">
            ${element.manufacturer}
          </div>`
        );
      }
    }

    $("#list").fadeIn(1000);
  }
};

List.continue = (filterType = "manufacturer", val = "Akina") => {
  switch (filterType) {
    case "category":
      CachedVehicles = Vehicles.filter((x) => x.type == val);
      break;

    case "manufacturer":
      CachedVehicles = Vehicles.filter((x) => x.manufacturer == val);
      break;

    case "skip":
      CachedVehicles = Vehicles.sort((a, b) => (a.price < b.price ? -1 : 1));
      break;
  }

  $("#list").fadeOut(1000);
  List.opened = false;
  Main.open();
};

List.open();

document.onkeydown = (event) => {
  if (List.opened && event.key && event.key == "Escape") {
    $("#list").fadeOut(1000);
    $.post("http://scarshop/disablefocus", JSON.stringify({}));
  }
};

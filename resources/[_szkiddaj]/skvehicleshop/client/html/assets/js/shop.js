let vehicleList = [],
  vehicleIndex = 0,
  vehicleColor = 112,
  vehicleModel = undefined;

const loadVehicleOptions = (list = []) => {
  vehicleList = list;
  vehicleIndex = 0;
  vehicleColor = 112;
  const elem = document.getElementById("car-list");
  elem.innerHTML = "";

  list.sort((a, b) => {
    let textA = a.name.toUpperCase();
    let textB = b.name.toUpperCase();
    return textA < textB ? -1 : textA > textB ? 1 : 0;
  });

  for (let i = 0; i < list.length; i++) {
    const data = list[i];
    const option = document.createElement("li");
    const text = document.createElement("a");
    option.setAttribute("onclick", `changeVehicleModel('${data.model}', ${i}, ${data.price})`);

    text.innerHTML = data.name;
    if (i == 0) option.classList.add("selected");

    option.appendChild(text);
    elem.appendChild(option);
  }

  $(".ae-select-content").text($(".dropdown-menu > li.selected").text());

  var newOptions = $(".dropdown-menu > li");
  newOptions.click(function () {
    $(".ae-select-content").text($(this).text());
    $(".dropdown-menu > li").removeClass("selected");
    $(this).addClass("selected");
  });

  vehicleModel = list[0].model;
  changeVehicleModel(list[0].model, 0, list[0].price);
};

const changeCameraPosition = (index) => {
  $.post(
    "http://skvehicleshop/changecam",
    JSON.stringify({
      index: index,
    })
  );
};

const changeVehicleModel = (model, index, price) => {
  document.getElementById("car-price").innerHTML = formatter.format(price);
  vehicleIndex = index;
  vehicleModel = model;
  $.post(
    "http://skvehicleshop/changevehicle",
    JSON.stringify({
      model: vehicleModel,
    })
  );
};

const changeVehicleColor = (color) => {
  vehicleColor = color;
  $.post(
    "http://skvehicleshop/changecolor",
    JSON.stringify({
      color: color,
    })
  );
};

const buyVehicle = () => {
  if (vehicleList && vehicleList[vehicleIndex] && vehicleColor) {
    $.post(
      "http://skvehicleshop/buyvehicle",
      JSON.stringify({
        model: vehicleModel,
      })
    );
  }
};

window.onload = () => {
  document.getElementById("body").classList.remove("preload");
};

var aeDropdown = $(".ae-dropdown");
aeDropdown.click(function () {
  $(".dropdown-menu").toggleClass("ae-hide");
});

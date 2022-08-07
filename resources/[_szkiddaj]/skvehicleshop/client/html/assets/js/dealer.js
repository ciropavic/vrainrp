let vehicleNames = {},
  vehicles = [];

function loadImporterVehicles(cars = []) {
  vehicleList = cars;
  vehicles = [];
  document.getElementById("cart-items").innerHTML = "";
  const items = document.getElementById("items");
  items.innerHTML = "";

  cars.sort((a, b) => a.name.localeCompare(b.name));
  cars.forEach((elem, index) => {
    const parent = document.createElement("tr");
    const id = document.createElement("td");
    const name = document.createElement("td");
    const price = document.createElement("td");
    const count = document.createElement("td");
    const countInput = document.createElement("input");
    const addBtn = document.createElement("button");
    const add = document.createElement("td");

    id.innerHTML = index + 1;
    name.innerHTML = elem.name;
    price.innerHTML = `${formatter.format(elem.price)} / db`;
    addBtn.innerHTML = "Hozzáadás";
    addBtn.classList.add("addCart");
    add.appendChild(addBtn);
    countInput.id = `input-${elem.model}`;
    countInput.classList.add("itemCount");
    countInput.value = 1;
    countInput.min = 1;
    countInput.max = 25;
    count.appendChild(countInput, index);
    addBtn.setAttribute("onclick", `addVehicleToList('${elem.model}')`);

    vehicleNames[elem.model] = elem.name;

    parent.appendChild(id);
    parent.appendChild(name);
    parent.appendChild(count);
    parent.appendChild(price);
    parent.appendChild(add);
    items.appendChild(parent);
  });
}

const addVehicleToList = (model) => {
  const input = document.getElementById(`input-${model}`);
  if (input) {
    if (parseInt(input.value)) {
      const value = parseInt(input.value);
      if (!vehicles[model]) {
        vehicles[model] = value;

        $("#cart-items").append(`
          <tr id='cart-${model}'>
            <td id='cart-name-${model}' style='width: 100%'>
              ${vehicleNames[model]} (${input.value} db)
            </td>
            <td>
              <button onclick='removeVehicleFromCart("${model}")'>
                <i class='fas fa-times'></i>
              </button>
            </td>
          </tr>
        `);
      } else {
        vehicles[model] += value;
        const name = document.getElementById(`cart-name-${model}`);
        if (name)
          name.innerHTML = `${vehicleNames[model]} (${vehicles[model]} db)`;
      }
      countVehicleCart();
    } else {
      input.value = 1;
    }
  }
};

const removeVehicleFromCart = (model) => {
  const elem = $(`#cart-${model}`);
  if (elem) {
    elem.remove();
    vehicles[model] = undefined;
  }
  countVehicleCart();
};

const buyVehicles = () => {
  let tmpData = [];

  for (const key in vehicles) {
    if (vehicles.hasOwnProperty(key)) {
      const element = vehicles[key];
      tmpData.push({ model: key, count: element });
    }
  }

  $.post(
    "http://skvehicleshop/buyvehiclesasdealer",
    JSON.stringify({
      data: tmpData,
    })
  );

  vehicles = [];
};

const countVehicleCart = () => {
  let total = 0;

  for (const key in vehicles) {
    if (vehicles.hasOwnProperty(key)) {
      const count = vehicles[key];
      const price = vehicleList.find((x) => x.model == key).price;
      total += count * price;
    }
  }

  const btn = document.getElementById("buy");
  if (btn) btn.innerHTML = `Vásárlás (${formatter.format(total || 0)})`;

  return total;
};

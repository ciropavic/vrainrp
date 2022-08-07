const formatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

window.onload = () => {
  window.addEventListener("message", (e) => {
    const data = e.data;
    if (data.panel == "shop") {
      data.display ? $(".shop").fadeIn(250) : $(".shop").fadeOut(250);

      if (data.func) {
        switch (data.func) {
          case "load":
            loadVehicleOptions(JSON.parse(data.data));

            // Kamera összerakása
            $(".cam-positions").text("");
            for (let index = 0; index < data.cameraCount; index++) {
              let parent = document.createElement("div");
              let text = document.createElement("p");
              parent.classList.add("position");
              parent.setAttribute("onclick", `changeCameraPosition(${index + 1})`);
              text.innerHTML = index + 1;

              parent.appendChild(text);
              document.getElementById("cam-positions").appendChild(parent);
            }

            break;
          default:
            break;
        }
      }
    } else if (data.panel == "import") {
      data.display ? $(".dealer").fadeIn(250) : $(".dealer").fadeOut(250);

      if (data.func) {
        switch (data.func) {
          case "open":
            loadImporterVehicles(data.data);

            break;
          default:
            break;
        }
      }
    }
  });

  document.addEventListener("keydown", function (event) {
    const key = event.key;
    if (key === "Escape") {
      $(".wrapper").fadeOut(250);
      $(".dealer").fadeOut(250);
      $.post(
        "http://skvehicleshop/close",
        JSON.stringify({
          panel: "both",
        })
      );
    }
  });
};

$(function () {
  let Players = [];
  let State = false;

  const getLatencyColor = (ping = 0) => {
    if (ping < 35) return "#2e841f";
    if (ping < 60) return "#bf6526";
    return "#892c2c";
  };

  const addPlayer = (id, data) => {
    const hasElement = Object.keys($(`#player-${id}`)).length > 0;

    if (!hasElement) {
      $("#player-list").append(`
            <div class="player" id="player-${id}" style="${
        data.isLocalPlayer ? "background: #273844 " : ""
      }">
                <img
                    src="${data.avatar}"
                    class="avatar"
                    id="avatar"
                    style="--color: ${getLatencyColor(data.ping)}"
                />
                <div class="id">${id}</div>
                <div class="name" id="name">
                    ${data.name}
                </div>
            </div>
        `);
    } else {
      updatePlayer(id, data);
    }
  };

  const updatePlayer = (id, data) => {
    const element = document.getElementById(`player-${id}`);

    if (element) {
      if (data.ping && element.children[0])
        element.children[0].style.setProperty(
          "--color",
          getLatencyColor(data.ping)
        );

      if (
        data.name &&
        element.children[2] &&
        element.children[2].innerHTML != data.name
      )
        element.children[2].innerHTML = data.name;
    }
  };

  addEventListener("message", (event) => {
    const data = event.data;

    if (data && data.action) {
      switch (data.action) {
        case "update":
          const players = JSON.parse(data.players);
          let inactivePlayers = Players;

          for (let i = 0; i < players.length; i++) {
            const element = players[i];
            inactivePlayers = inactivePlayers.filter((x) => x.id != element.id);
            addPlayer(element.id, element);
          }

          for (let i = 0; i < inactivePlayers.length; i++) {
            const element = $(`#player-${inactivePlayers[i].id}`);
            if (element) element.remove();
          }

          Players = players;
          $("#player-count").text(Players.length);

          break;

        case "toggle":
          if (data.state && data.state != State) {
            $("#wrapper").fadeIn(200);
            State = true;
          } else if (!data.state && data.state != State) {
            $("#wrapper").fadeOut(200);
            State = false;
          }

          break;
      }
    }
  });

  document.onkeyup = function (event) {
    console.log(event.key);
    if (event.key == "F11" && State) {
      $("#wrapper").fadeOut();
      State = false;
      $.post("http://sscoreboard/close");
    }
  };
});

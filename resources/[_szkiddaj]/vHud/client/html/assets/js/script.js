window.onload = () => {
  const typedUpdateInterval = 1000;
  let typed;
  let typedLast;
  let typedStrings;

  const formatter = new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  });

  const updateTyping = (texts) => {
    if (typed) {
      typed.destroy();
      typed = undefined;
    }

    var options = {
      strings: texts,
      typeSpeed: 100,
      backSpeed: 30,
      showCursor: false,
      shuffle: false,
      backDelay: 2000,
      loop: true,
    };

    typed = new Typed("#typed-text", options);
  };

  addEventListener("message", async (event) => {
    const data = event.data;

    if (data.action) {
      switch (data.action) {
        case "toggle":
          document.getElementById("wrapper").style.display = data.display ? "block" : "none";
          break;

        case "update":
          // Bars
          document.getElementById("stat-health").style.width = `${data.data.health}%`;
          document.getElementById("stat-armour").style.width = `${data.data.armour}%`;
          document.getElementById("stat-starving").style.width = `${data.data.starving}%`;
          document.getElementById("stat-thirst").style.width = `${data.data.thirst}%`;

          // Texts
          document.getElementById("char-name").innerHTML = data.data.name;
          document.getElementById("id").innerHTML = `(${data.data.id})`;
          document.getElementById("money").innerHTML = formatter.format(data.data.money);

          const jobName =
            data.data.job.name.length > 16
              ? `${data.data.job.name.substr(0, 16)}...`
              : data.data.job.name;

          document.getElementById("job-name").innerHTML = `${jobName} - ${data.data.job.grade}`;

          if (data.data.job.players) {
            const time = new Date().getTime();
            if (!typedLast || typedLast + typedUpdateInterval < time) {
              typedLast = time;

              let update = false;
              const strings = [`${data.data.job.players} elérhető frakciótag`];

              if (data.data.job.isBoss) {
                strings.push(
                  `${formatter
                    .format(data.data.job.money)
                    .replace("$", "<span style='color: rgb(53, 124, 53);'>$</span> ")}`
                );
              }

              if (!typedStrings || typedStrings.length > strings) {
                update = true;
              }

              if (!update && typedStrings) {
                update = !strings.every((v, i) => typedStrings[i] && typedStrings[i] == v);
              }

              if (update) {
                typedStrings = strings;
                updateTyping(typedStrings);
              }
            }
          } else {
            if (typed) {
              typed.destroy();
              typed = undefined;
              document.getElementById("typed-text").innerHTML = "";
            }
          }

          break;
      }
    }
  });
};

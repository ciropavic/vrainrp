(async () => {
  const Interactions = {};

  /*
    @key
    @description - short description
    @options - Options of the interaction ({ interval: number })
  */
  const addInteraction = (key, description, options) => {
    if (typeof key !== "string" || Interactions[key]) {
      return false;
    }

    key = key.toUpperCase();

    const container = document.getElementById("Container");

    const interaction = document.createElement("div");
    interaction.classList.add("interaction");
    interaction.style.setProperty("--key", ` "${key}"`);
    interaction.style.setProperty("--progress", ` ${0}%`);

    const iconElement = document.createElement("div");
    iconElement.classList.add("keyicon");
    interaction.appendChild(iconElement);

    const descriptionElement = document.createElement("div");
    descriptionElement.classList.add("description");
    descriptionElement.innerText = description;
    interaction.appendChild(descriptionElement);

    const { interval } = options;
    Interactions[key] = {
      element: interaction,
      state: false,
      progress: 0,
      interval: null,
      options: {
        interval: interval || 2000,
      },
    };

    container.appendChild(interaction);
    return true;
  };

  const removeInteraction = (key) => {
    if (typeof key !== "string" || !Interactions[key]) {
      return false;
    }

    if (Interactions[key].interval) {
      clearInterval(Interactions[key].interval);
    }

    Interactions[key].element.remove();
    delete Interactions[key];

    return true;
  };

  function clamp(num, min, max) {
    return num <= min ? min : num >= max ? max : num;
  }

  const __updateInteractionProgress = (key) => {
    if (!Interactions[key]) {
      return false;
    }

    const interaction = Interactions[key];
    const progress = -(
      ((interaction.tick + interaction.options.interval - new Date().getTime()) / interaction.options.interval) * 100 -
      100
    );
    interaction.element.style.setProperty("--progress", ` ${clamp(progress, 0, 100)}%`);

    if (progress >= 100) {
      if (interaction.interval) {
        clearInterval(interaction.interval);
      }

      Interactions[key].state = false;
      Interactions[key].tick = null;
      Interactions[key].interval = null;

      removeInteraction(key);

      fetch("https://vinteraction/on_interaction", {
        method: "POST",
        body: JSON.stringify({ key }),
      });
    }
  };

  window.addEventListener("message", ({ data }) => {
    const { action, payload } = data;

    if (action === "ADD") {
      const { key, description, options } = payload;

      addInteraction(key, description, options);
    } else if (action === "REMOVE") {
      const { key } = payload;

      removeInteraction(key);
    } else if (action === "ON_KEY_PRESS") {
      let { key } = payload;
      key = key.toUpperCase();

      if (!Interactions[key]) {
        return;
      }

      const { state, progress } = Interactions[key];

      if (state || progress >= 100) {
        return false;
      }

      Interactions[key].state = true;
      Interactions[key].tick = new Date().getTime();
      Interactions[key].interval = setInterval(() => __updateInteractionProgress(key), 0);
    } else if (action === "ON_KEY_RELEASE") {
      let { key } = payload;
      key = key.toUpperCase();

      if (!Interactions[key]) {
        return;
      }

      let { state } = Interactions[key];

      if (!state) {
        return false;
      }

      if (Interactions[key].interval) {
        clearInterval(Interactions[key].interval);
      }

      Interactions[key].state = false;
      Interactions[key].tick = null;
      Interactions[key].interval = null;

      Interactions[key].element.style.setProperty("--progress", ` ${0}%`);
    }
  });
})();

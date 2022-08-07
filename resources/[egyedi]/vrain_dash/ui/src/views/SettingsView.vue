<template>
  <div>
    <h4>Beállítások</h4>

    <ul>
      <li v-for="(data, name) in settings" :key="name">
        <div class="form-check form-switch">
          <input
            class="form-check-input"
            :type="data.input_type"
            :min="data.minValue"
            :max="data.maxValue"
            v-model="data.value"
            @change="updateSetting($event, name)"
            checked
          />

          {{ data.label }}
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "SettingsView",
  computed: {
    settings() {
      return this.$root.settings;
    },
  },
  methods: {
    updateSetting(event, name) {
      const { checked, value } = event.target;
      // console.log(checked, value, name);

      fetch(`https://${GetParentResourceName()}/updateSetting`, {
        method: "POST",
        body: JSON.stringify({
          name,
          checked,
          value,
        }),
      });

      localStorage.setItem("dashboard:" + name, checked);
    },
  },
  async created() {
    const response = await fetch(
      `https://${GetParentResourceName()}/fetchSettings`
    );
    const { settings } = await response.json();

    console.log(JSON.stringify(settings));

    if (settings !== undefined) {
      this.settings = {};

      for (const setting of settings) {
        let stored = localStorage.getItem("dashboard:" + setting.name);
        stored = stored === null ? setting.defaultValue : stored;

        this.settings[setting.name] = {
          label: setting.label,
          ...setting,
          value: stored,
        };

        fetch(`https://${GetParentResourceName()}/updateSetting`, {
          method: "POST",
          body: JSON.stringify({
            name: setting.name,
            checked: stored,
            storeLoad: true,
          }),
        });
      }
    }
  },
};
</script>

<style scoped>
ul {
  list-style: none;
}

ul > li > div > input[type="range"] {
  width: 200px;
  margin-right: 4pt;
}
</style>

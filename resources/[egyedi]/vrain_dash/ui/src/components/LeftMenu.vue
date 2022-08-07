<template>
  <div class="main text-center px-2">
    <div class="logo-container">
      <svg
        id="uwu"
        data-name="Layer 1"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 973.34 817.24"
        class="logo"
        x="0px"
        y="0px"
        viewbox="0 0 2000 2000"
        style="enable-background: new 0 0 2000 2000"
      >
        <defs></defs>
        <polygon
          class="cls-1"
          points="367.3 351.23 156.1 0 0 0 367.3 622.11 658.84 137.74 727.71 140.03 408.62 681.8 482.63 817.24 973.34 0 580.79 0 487.84 153.3 390.26 0 229.56 0 406.99 285.96 367.3 351.23"
        />
      </svg>
    </div>

    <div v-for="route in routes" :key="route">
      <router-link :to="route.path">
        <div
          class="menu-link p-1 mt-2"
          :class="{ active: route.path === currentPath }"
          v-html="route.name"
        ></div>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "LeftMenu",
  computed: {
    routes() {
      return this.$router.getRoutes();
    },
    currentPath() {
      return this.$route.path;
    },
  },
};
</script>

<style scoped>
.main {
  width: 15em;
  background-color: rgb(25, 25, 25);
}
.main a {
  color: white !important;
  text-decoration: none !important;
}
.logo-container {
  width: 100%;
  height: 5em;
  margin-top: 1em;
}
.menu-link {
  background-color: rgb(40, 40, 40);
  border-radius: 0.25em;
  transition: background-color 0.25s linear;
}
.menu-link:hover {
  background-color: rgb(50, 50, 50);
  transition: background-color 0.25s linear;
}

.active {
  border-left: 0.25em solid #7946c5;
}

.logo-container > .logo {
  width: 40%;
  /* transform: translate(10%, 20%); */
  -webkit-animation: logoanim 5s linear forwards;
  animation: logoanim 5s linear forwards;
}

.logo-container > .logo > polygon {
  stroke: #975fea;
  stroke-width: 24px;
  stroke-dasharray: 4986.1513671875;
}

@-webkit-keyframes logoanim {
  0% {
    fill: none;
    stroke-dashoffset: 4986.1513671875;
  }
  75% {
    fill: rgba(0, 204, 102, 0);
    stroke-dashoffset: 0;
  }
  100% {
    fill: #7946c5;
  }
}

@keyframes logoanim {
  0% {
    fill: none;
    stroke-dashoffset: 4986.1513671875;
  }
  75% {
    fill: rgba(0, 204, 102, 0);
    stroke-dashoffset: 0;
  }
  100% {
    fill: #7946c5;
  }
}
</style>

<template>
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
    <div class="container px-5">
      <router-link class="navbar-brand" to="/">Samer Alshaer</router-link>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarResponsive"
        aria-controls="navbarResponsive"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Home</router-link>
          </li>
          <li class="nav-item" v-if="this.$store.state.currentUser.isLogin">
            <router-link class="nav-link" to="/Students">Students</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/about">About</router-link>
          </li>
          <li class="nav-item" v-if="!this.$store.state.currentUser.isLogin">
            <router-link class="nav-link" to="/Login">Log In</router-link>
          </li>
          <li
            class="nav-item btn-primary logout-li"
            style="border-radius:6px"
            @click="logout()"
            v-if="this.$store.state.currentUser.isLogin"
          >
            <router-link class="nav-link logout-btn" to>Log out</router-link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
<script>
export default {
  name: "mainhead",
  data() {
    return {
      result: ""
    };
  },
  methods: {
    logout: function() {
      var token = JSON.parse(localStorage.getItem("accessToken"));
      axios.post("api/logout?token=" + token, {});
       localStorage.removeItem("accessToken")
        this.$store.state.currentUser.isLogin = false;
      this.$router.push({ path: "Login" });
    },

    isLogin() {
      return (this.$store.state.currentUser.isLogin = localStorage.accessToken);
    }
  },

  mounted() {
   this.isLogin()
  }
};
</script>

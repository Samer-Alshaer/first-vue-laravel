<template>
  <!-- Update Students -->
  <div
    class="update-cont"
    data-aos="zoom-in"
    data-aos-duration="400"
    id="updateStudent"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h5 class="modal-title" id="exampleModalLabel">Update Student</h5>
        </div>
        <div class="modal-body">
          <form>
            <div class="mb-3">
              <label for="name" class="col-form-label">name:</label>
              <input type="text" v-model="students.data.name" class="form-control" id="name" />
            </div>
            <div class="mb-3">
              <label for="age" class="col-form-label">age:</label>
              <input type="text" v-model="students.data.age" class="form-control" id="age" />
            </div>
            <div class="mb-3">
              <label for="Note" class="col-form-label">Picture:</label>
              <input
                type="file"
                class="form-control"
                ref="file"
                @change="updateImage()"
                name="img"
                id="img"
              />
              <img
                class="pt-2"
                style="cursor:pointer; width:120px; height:90px;"
                id="img"
                :src="`/Uploads/${students.data.img}`"
              />
            </div>
          </form>
        </div>
        <div class="modal-footer d-flex justify-content-between">
            <router-link class="btn btn-secondary" to="/Students">
                Back
            </router-link>
         
          <button type="button" @click="updateStudent()" class="btn btn-primary">Update</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "update-student",
  data() {
    return {
      students: [],
      name: "",
      age: "",
      result: ""
    };
  },

  methods: {
    loadData() {
      let id = this.$route.params.id;
      axios
        .get(`/api/getstudents/${id}`)
        .then(data => (this.students = data.data));
    },

    updateStudent() {
      let formData = new FormData();
      formData.append("name", this.students.data.name);
      formData.append("age", this.students.data.age);
      formData.append("img", this.img);
      formData.append("id", this.students.data.id);
      formData.append("_method", "POSt");
      var token = JSON.parse(localStorage.getItem("accessToken"));
      axios
        .post("/api/editstudent/?token=" + token, formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(data => {
          this.result = data;
          if (this.result && this.result.data.status == "success") {
            Swal.fire({
              toast: true,
              icon: "success",
              title: "Student Updated successfully !",
              animation: false,
              position: "bottom",
              showConfirmButton: false,
              timer: 2000,
              timerProgressBar: true,
              didOpen: toast => {
                toast.addEventListener("mouseenter", Swal.stopTimer);
                toast.addEventListener("mouseleave", Swal.resumeTimer);
              }
            });
            this.$router.push({ path: "/Students" });
          }
        });
    },
    updateImage() {
      this.img = this.$refs.file.files[0];
    }
  },

  mounted() {
    this.loadData();
  }
};
</script>

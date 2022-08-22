<template>
  <div
    class="update-cont"
    data-aos="zoom-in"
    data-aos-duration="400"
    id="addBook"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h5 class="modal-title" id="exampleModalLabel">Add New Book</h5>
        </div>
        <div class="modal-body">
          <form>
            <div class="mb-3">
              <label for="Title" class="col-form-label">Title:</label>
              <input
                type="text"
                v-model="title"
                :class="['form-control', errors.title ? 'is-invalid' : '']"
                id="Title"
              />
              <span
                class="text-danger"
                style="font-size: 0.8rem;"
                v-if="errors.title"
              >{{errors.title[0]}}</span>
            </div>
            <div class="mb-3">
              <label for="description" class="col-form-label">Description:</label>
              <textarea
                :class="['form-control', errors.description ? 'is-invalid' : '']"
                v-model="description"
                id="description"
              ></textarea>
              <span
                class="text-danger"
                style="font-size: 0.8rem;"
                v-if="errors.description"
              >{{errors.description[0]}}</span>
            </div>
            <div class="mb-3">
              <label for="Note" class="col-form-label">Picture:</label>
              <input
                type="file"
                ref="file"
                @change="addImage()"
                :class="['form-control', errors.img ? 'is-invalid' : '']"
                name="img"
                id="img"
              />
              <span
                class="text-danger"
                style="font-size: 0.8rem;"
                v-if="errors.img"
              >{{errors.img[0]}}</span>
            </div>
          </form>
        </div>
        <div class="modal-footer d-flex justify-content-between">
          <router-link class="btn btn-secondary" to="/Students">Back</router-link>
          <button type="button" @click="addBook()" class="btn btn-primary">Add</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "add-book",
  data() {
    return {
      title: "",
      description: "",
      img: "",
      result: "",
      errors: []
    };
  },
  methods: {
    addBook: function() {
      let formData = new FormData();
      formData.append("title", this.title);
      formData.append("description", this.description);
      formData.append("img", this.img);
      formData.append("student_id", this.$route.params.id);
      var token = JSON.parse(localStorage.getItem("accessToken"));
      axios
        .post("api/addBook?token=" + token, formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(data => {
          this.result = data;

          if (this.result.data.status == "success") {
            this.$router.push({ path: "/Students" });
            Swal.fire({
              toast: true,
              icon: "success",
              title: "Book Addes Successfully",
              animation: false,
              position: "bottom",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
              didOpen: toast => {
                toast.addEventListener("mouseenter", Swal.stopTimer);
                toast.addEventListener("mouseleave", Swal.resumeTimer);
              }
            });
          }
        })
        .catch(error => {
          this.errors = error.response.data.errors;
        });
    },

    addImage() {
      this.img = this.$refs.file.files[0];
    }
  }
};
</script>

<template>
  <div>
    <v-app-bar color="green" dark>
    </v-app-bar>
    <v-card class="adicionarlocal">
      <h2>Adicionar Local</h2>
      <label>
        <gmap-autocomplete
          @place_changed="setPlace">
        </gmap-autocomplete>
        <button @click="addMarker">Adicionar</button>
      </label>
      <div class="places">
        <ul>
          <li
            v-for="item in places"
            :key="item.id"
            @click="openPlace(item)"
            v-if="item.place_id"
          >{{item.name}}</li>
        </ul>
      </div>
    </v-card>
    
    <gmap-map
      :center="center"
      :zoom="17"
      style="width:100%;  height: 98vh;"
    >
    <gmap-marker
      :key="index"
      v-for="(m, index) in places"
      :position="m.position"
      :clickable="true"
      :draggable="false"
      :icon="m.icon"
      @click="detail(m)"
      ></gmap-marker>
    </gmap-map>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      center: { lat: 45.508, lng: -73.587 },
      markers: [],
      places: [],
      currentPlace: null,
    };
  },
   components: {
    
  },

  mounted() {
    this.geolocate();
  },

  methods: {
    setPlace(place) {
      this.currentPlace = place;
    },
    addMarker() {
      console.log(this.currentPlace);
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng()
        };
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    },
    geolocate: function() {
      navigator.geolocation.getCurrentPosition(position => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
      });
    },
    openPlace(place) {
      console.log(place);
      this.center = this.marker;
    }
  }
};
</script>

<style>
  .adicionarlocal {
    position: fixed;
    background: gray;
    overflow-y: auto;
    z-index: 20;
    width: 400px;
    height:200px;
    right: 10px;
    top: 150px;
    padding: 20px;
  }

  .places {
  width: 100%;
  ul {
    display: flex;
    flex-direction: column;
    margin: 0;
    padding: 0;
    li {
      height: 50px;
      border-bottom: solid 1px white;
      text-decoration: none;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
      font-size: 15px;
      text-align: center;
      cursor: pointer;
    }
  }
}
</style>
   
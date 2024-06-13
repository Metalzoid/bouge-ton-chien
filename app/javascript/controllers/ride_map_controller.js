import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    route: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/metalzoid/clvxouh5502av01qpetk7a9eu",
    });
    this.#addLocationToMap();
    this.#addRouteToMap();
    this.#fitMapToLocation();
    this.#startTimer();
  }

  intervalId = null;

  #startTimer() {
    const target = document.getElementById("timer");
    const input = document.getElementById("ride_timing");
    let seconds = 0;
    let minutes = 0;
    this.intervalId = setInterval(() => {
      if (seconds < 59) {
        seconds++;
      } else {
        seconds = 0;
        minutes++;
      }
      target.innerText = `${minutes}:${(seconds <= 9 ? `0${seconds}` : seconds)}`
      input.value = `${(minutes * 60) + seconds}`
    }, 200);
  }

  #stopTimer() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = null;
      document.getElementById("finish").classList.remove("d-none");
    }
  }

  #fitMapToLocation() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 18, duration: 0 });
  }

  #addRouteToMap() {
    this.map.on('load', () => {
      this.map.addSource('route', {
          'type': 'geojson',
          'data': {
              'type': 'Feature',
              'properties': {},
              'geometry': {
                  'type': 'LineString',
                  'coordinates': this.routeValue
              }
          }
      });
      this.map.addLayer({
          'id': 'route',
          'type': 'line',
          'source': 'route',
          'layout': {
              'line-join': 'round',
              'line-cap': 'round'
          },
          'paint': {
              'line-color': 'red',
              'line-width': 8
          }
      });
    });

  }

  #addLocationToMap() {
    this.map.on('load', async () => {
      // Get the initial location of the user.
      const geojson = await this.#getLocation();

      // Add the user's location as a source.
      this.map.addSource('user', {
        type: 'geojson',
        data: geojson
      });

      this.map.loadImage('https://i.postimg.cc/k5BGkSPy/marker.png', (error, image) => {
        if (error) throw error;
        this.map.addImage('custom-marker', image);
      });
      // Add the user symbol layer to the map.
      this.map.addLayer({
        id: 'user',
        type: 'symbol',
        source: 'user',
        layout: {
          'icon-image': 'mapbox-triangle'
        }
      });

      // Update the source from the API every 2 seconds.
      const updateSource = setInterval(async () => {
        const geojson = await this.#getLocation(updateSource);
        this.map.getSource('user').setData(geojson);
      }, 10000);

    });
  }

  async #getLocation(updateSource = null) {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(position => {
        const userLocation = position.coords;

        // Fly the map to the location.
        this.map.flyTo({
          center: [userLocation.longitude, userLocation.latitude],
          speed: 1
        });

        // Return the location of the user as GeoJSON.
        resolve({
          type: 'FeatureCollection',
          features: [
            {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: [userLocation.longitude, userLocation.latitude]
              }
            }
          ]
        });
      }, err => {
        // If the updateSource interval is defined, clear the interval to stop updating the source.
        if (updateSource) clearInterval(updateSource);
        reject(new Error(err.message));
      });
    });
  }

  disconnect() {
    this.map.remove();
  }
}

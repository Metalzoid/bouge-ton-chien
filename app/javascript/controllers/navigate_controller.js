import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
    });
    this.#addLocationToMap();
    this.#addMarkersToMap()
    this.#fitMapToLocation();
  }

  

  async #fitMapToLocation() {
    const bounds = new mapboxgl.LngLatBounds();
    const geojson = await this.#getLocation();
    bounds.extend(geojson.features[0].geometry.coordinates);
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0});
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
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

      // Add the user symbol layer to the map.
      this.map.loadImage(
        'https://docs.mapbox.com/mapbox-gl-js/assets/custom_marker.png',
        (error, image) => {
            if (error) throw error;
            this.map.addImage('custom-marker', image);
        })
      this.map.addLayer({
        id: 'user',
        type: 'symbol',
        source: 'user',
        layout: {
          'icon-image': 'custom-marker'
        }
      });

      // Update the source from the API every 10 seconds.
      const updateSource = setInterval(async () => {
        const geojson = await this.#getLocation(updateSource);
        this.map.getSource('user').setData(geojson);
      }, 100000);

    });
  }

  async #getLocation(updateSource = null) {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(position => {
        const userLocation = position.coords;

        // Fly the map to the location.

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
}

import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

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
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#fitMapToLocation();
    this.#addRouteToMap();
  }

  #fitMapToLocation() {
    const bounds = new mapboxgl.LngLatBounds();
    this.routeValue.forEach(marker => bounds.extend(marker));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
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
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75
          }
      });
    });

  }

  disconnect() {
    this.map.remove();
  }
}

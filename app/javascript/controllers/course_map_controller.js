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
      style: "mapbox://styles/metalzoid/clvxouh5502av01qpetk7a9eu"
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
              'line-color': '#ca6702',
              'line-width': 6
          }
      });
    });

  }

  disconnect() {
    this.map.remove();
  }
}

import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    course: Array,
    markers: Array
  }

  static targets = ["instruction"]

  async connect() {
    this.currentCoordinates = await this.#getCoordinates()
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: this.wagonCoordValue,
      zoom: 9
    });
    this.map.on('load', () => {
      this.#addMarkersToMap();
      this.#fitMapToLocation();
      this.#callApi(this.currentCoordinates);
    });

  }

  #getCoordinates() {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(position => {
        resolve([position.coords.longitude, position.coords.latitude])
      }, err => reject(err))
    })
  }

  async #fitMapToLocation() {
    try {
      const userLocation = await this.#getCoordinates()
      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend(userLocation);
      bounds.extend([this.markersValue[0].lng, this.markersValue[0].lat]);
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 18, duration: 0 });
      setTimeout(() => {
        this.map.flyTo({
          center: userLocation,
          speed: 0.6,
          zoom: 17
        });
      }, 1500)
    } catch (err) {
      console.log(`An error occured while fitting map to location: ${err.message}`)
    }

  }

  #addMarkersToMap() {
    this.markersValue.forEach(marker => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #addLocationToMap(coord, route) {
    this.map.addSource('user', {
      type: 'geojson',
      data: {
        type: 'FeatureCollection',
        features: [
          {
            type: 'Feature',
            geometry: {
              type: 'Point',
              coordinates: coord
            }
          }
        ]
      }
    })

    this.map.loadImage('https://docs.mapbox.com/mapbox-gl-js/assets/custom_marker.png', (error, image) => {
      if (error) throw error;
      this.map.addImage('custom-marker', image);
    });

    this.map.addLayer({
      id: 'usericon',
      type: 'symbol',
      source: 'user',
      layout: {
        'icon-image': 'custom-marker'
      }
    });


    const updateSource = setInterval(async () => {
      if (this.map.getSource('user')) {
        this.#showInstruction(route)
        const userLocation = await this.#getCoordinates();
        const geojson = {
          type: 'FeatureCollection',
          features: [
            {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: userLocation
              }
            }
          ]
        }
        this.map.getSource('user').setData(geojson);
        if (await this.#verifyLocation(userLocation)) {
          document.querySelector("#ready-to-run").classList.remove("opacity-0");
          const link = document.querySelector(".btn-launch-ride").href;
          document.querySelector(".btn-launch-ride").href = `${link}?near=true`;
          this.instructionTarget.classList.add("opacity-0");
        }
      }
    }, 6000);

  }

  async #verifyLocation(userLocation) {
    return (userLocation[0].toFixed(4) == this.courseValue[0].lng.toFixed(4)) && (userLocation[1].toFixed(4) == this.courseValue[0].lat.toFixed(4))
  }

  async #showInstruction(route) {
    try {
      const instructions = this.instructionTarget;
      const steps = route.legs[0].steps;

      let tripInstructions = '';
      for (const step of steps) {
        tripInstructions += `<li>${step.maneuver.instruction}</li>`;
      }
      instructions.innerHTML = `<p><strong>Durée de l'itinéraire: ${Math.floor(
        route.duration / 60
      )} min 🏃 </strong></p><ol>${tripInstructions}</ol>
      `;
    } catch (err) {
      console.error('Error when showing instruction:', err)
    }
  }

  async #callApi(coord) {
      const getRoute = async (coord) => {
        try {
          const courseLatitude = this.courseValue[0].lat.toFixed(4);
          const courseLongitude = this.courseValue[0].lng.toFixed(4);
          const url = `https://api.mapbox.com/directions/v5/mapbox/walking/${coord[0].toFixed(4)},${coord[1].toFixed(4)};${courseLongitude},${courseLatitude}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;
          const response = await fetch(url, { method: 'GET' });
          if (!response.ok) throw new Error('Network response was not ok');
          const json = await response.json();
          return json.routes[0];
        } catch (error) {
          console.error('Error fetching route:', error);
          return null;
        }
      };

      const updateRoute = async (route) => {
        if (!route) return;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };

        // Add new route layer and source
        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75
          }
        });
      };

      const route = await getRoute(coord);
      this.#showInstruction(route)
      this.#addLocationToMap(coord, route);
      await updateRoute(route.geometry.coordinates);
  }

  disconnect() {
    this.map.remove();
  }
}

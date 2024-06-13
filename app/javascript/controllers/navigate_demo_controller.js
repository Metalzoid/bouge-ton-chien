import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    course: Array,
    markers: Array,
    wagonCoord: [-0.56576, 44.85920]
  }
  static targets = ["instruction"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/metalzoid/clvxouh5502av01qpetk7a9eu",
      center: this.wagonCoordValue,
      zoom: 9
    });
    this.map.on('load', () => {
      this.#addMarkersToMap();
      this.#addLocationToMap(this.wagonCoordValue);
      this.#fitMapToLocation();
      this.#callApi(this.wagonCoordValue);
    });
  }


  #fitMapToLocation() {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend(this.wagonCoordValue);
    bounds.extend([this.markersValue[0].lng, this.markersValue[0].lat]);
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 18, duration: 0 });
    setTimeout(() => {
      this.map.flyTo({
        center: this.wagonCoordValue,
        speed: 0.7,
        zoom: 17
      });
    }, 1000)

  }

  #addMarkersToMap() {
    this.markersValue.forEach(marker => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #addLocationToMap(coord) {
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
    });

    this.map.loadImage('https://i.postimg.cc/k5BGkSPy/marker.png', (error, image) => {
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

      // Simulate movement along the route
      let currentIndex = 0;
      const intervalId = setInterval(() => {
        if (currentIndex < route.length) {

          const currentCoord = route[currentIndex];
          const marker = this.map.getSource('user');
          marker.setData({
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                geometry: {
                  type: 'Point',
                  coordinates: currentCoord
                }
              }
            ]
          });
          if (this.map.getLayer('route')) {
            this.map.removeLayer('route');
          }
          if (this.map.getSource('route')) {
            this.map.removeSource('route');
          }
          const newline = {
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'LineString',
              coordinates: route.slice(currentIndex, -1)
            }
          };
          this.map.addLayer({
            id: 'route',
            type: 'line',
            source: {
              type: 'geojson',
              data: newline
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
          this.map.flyTo({
            center: currentCoord,
            speed: 0.7,
            zoom: 17
          });
          currentIndex++;
        } else {
          clearInterval(intervalId);
          document.querySelector("#ready-to-run").classList.remove("opacity-0");
          const link = document.querySelector(".btn-launch-ride").href;
          document.querySelector(".btn-launch-ride").href = `${link}?near=true`;
        }
      }, 500); // Move every 2 seconds
    };

    const fakeroute = await getRoute(coord);
    const route = [this.wagonCoordValue, [-0.56598, 44.85901], [-0.56664, 44.85857], [-0.56712, 44.85824], [-0.56751, 44.85796], [-0.56800, 44.85763], [-0.56852, 44.85727], [-0.56893, 44.85699], [-0.56927, 44.85675], [-0.56999, 44.85624], [-0.57052, 44.85587], [-0.57111, 44.85543], [-0.57169, 44.85505], [-0.57208, 44.85465], [-0.57226, 44.85440], [-0.57256, 44.85393], [-0.57264, 44.85384], [-0.57307, 44.85312], [-0.57346, 44.85246], [-0.57401, 44.85161], [-0.57474, 44.85045], [-0.57544,44.84933], [this.courseValue[0].lng, this.courseValue[0].lat]];
    await updateRoute(route);
  }

  disconnect() {
    this.map.remove();
  }

}

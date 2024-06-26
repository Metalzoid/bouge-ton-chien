import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    courselocation: Array,
    route: Array
  }
  static targets = ["instruction"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      zoom: 12,
      center: this.courselocationValue
    });
    this.map.on('load', () => {
      this.#addLocationToMap(this.courselocationValue);
      this.#callApi(this.courselocationValue, this.routeValue);
    });
    setTimeout(() => {
      this.map.flyTo({
        center: this.wagonCoordValue,
        speed: 0.7,
        zoom: 17
      });
      }, 1000)
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
    }, 20);
  }

  #stopTimer() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = null;
      document.getElementById("finish").classList.remove("d-none");
    }
  }

  #getCoordinates() {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(position => {
        resolve([position.coords.longitude, position.coords.latitude])
      }, err => reject(err))
    })
  }

  async #addLocationToMap(userLocation) {
    this.map.addSource('user', {
      type: 'geojson',
      data: {
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

  async #callApi(course, route) {
    const getRoute = async (firstCoord, endCoord) => {
      try {
        const url = `https://api.mapbox.com/directions/v5/mapbox/walking/${firstCoord[0]},${firstCoord[1]};${endCoord[0]},${endCoord[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`;
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
          'line-opacity': 0.85
        }
      });

      // Simulate movement along the route
      let currentIndex = 0;
      this.#startTimer();

      const intervalId = setInterval(async () => {
        if (currentIndex <= route.length) {

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
          this.#stopTimer();
          clearInterval(intervalId);
        }
      }, 500); // Move every 2 seconds
    };

    setTimeout(async () => {
      const last = [[-0.575984, 44.849334]];
      await updateRoute(route.concat(last));
    }, 3000)
  }

  disconnect() {
    clearInterval(this.intervalId);
    this.map.remove();
  }

}

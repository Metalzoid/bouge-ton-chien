import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

// [[-0.57556, 44.84936], [-0.57655, 44.84965], [-0.57702, 44.84981], [-0.57788, 44.85006], [-0.57883, 44.85037], [-0.57972, 44.85040], [-0.58081, 44.85018], [-0.58152, 44.84995], [-0.58093, 44.84971], [-0.58021, 44.84907], [-0.57958, 44.84832], [-0.57924, 44.84796], [-0.57866, 44.84778], [-0.57717, 44.84731], [-0.57704, 44.84780], [-0.57724, 44.84836], [-0.57687, 44.84838], [-0.57654, 44.84841], [-0.57628, 44.84848], [-0.57600, 44.84899], [-0.57558, 44.84937]]

export default class extends Controller {
  static values = {
    apiKey: String,
    courselocation: Array,
    route: Array
  }
  static targets = ["instruction"];

  connect() {
    this.#startTimer();
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
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
    }, 200);
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
  }

  async #showInstruction(route) {
    try {
      this.instructionTarget.classList.remove("opacity-0")
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
          'line-opacity': 0.75
        }
      });

      // Simulate movement along the route
      let currentIndex = 0;
      const intervalId = setInterval(async () => {
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
          if (route.slice(currentIndex, -1).length > 0) {
            const instructionRoute = await getRoute(route[currentIndex], route.slice(-1));
            this.#showInstruction(instructionRoute);
          }

        } else {
          clearInterval(intervalId);
          this.instructionTarget.classList.add("opacity-0");
          this.#stopTimer();
        }
      }, 500); // Move every 2 seconds
    };

    setTimeout(async () => {
      const last = [[-0.57558, 44.84937]];
      await updateRoute(route.concat(last));
    }, 3000)
  }

  disconnect() {
    this.map.remove();
  }

}

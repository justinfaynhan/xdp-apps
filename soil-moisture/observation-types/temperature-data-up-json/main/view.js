function(endDevice, latestObservation) {
  return {
    observationsMapValue: 'temperature',
    observationsMapGauge: 'temperature',
    fields: {
      temperature: {
        value: latestObservation.data.temperature,
        name: 'temperature',
        text: latestObservation.data.temperature + ' °C',
        color: latestObservation.data.temperature > 50 ? 'danger' : 'success',
        scaleMin: 0,
        scaleMax: 100
      }
    }
  };
}

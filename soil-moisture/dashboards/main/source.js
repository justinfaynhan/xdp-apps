function() {
  return {
    panels: {
      latestVwc: {
        title: 'Latest VWC',
        type: 'ObservationBarChartCard',
        data: {
          topic: 'soil-vwc-data-up-json',
          field: 'vwc'
        }
      },
      historicalVwc: {
        title: 'VWC History',
        type: 'ObservationTimeSeriesCard',
        data: {
          topic: 'soil-vwc-data-up-json',
          field: 'vwc'
        }
      },
      latestTemperature: {
        title: 'Latest Temperature',
        type: 'ObservationBarChartCard',
        data: {
          topic: 'soil-temperature-data-up-json',
          field: 'temperature'
        }
      },
      historicalTemperature: {
        title: 'Temperature History',
        type: 'ObservationTimeSeriesCard',
        data: {
          topic: 'soil-temperature-data-up-json',
          field: 'temperature'
        }
      },
      latestEC: {
        title: 'Latest EC',
        type: 'ObservationBarChartCard',
        data: {
          topic: 'soil-ec-data-up-json',
          field: 'EC'
        }
      },
      historicalEC: {
        title: 'EC History',
        type: 'ObservationTimeSeriesCard',
        data: {
          topic: 'soil-ec-data-up-json',
          field: 'EC'
        }
      },
    },
    layout: [
      { type: "row", entries: [
        { type: "col", size: 4, entries: ["latestVwc"]},
        { type: "col", size: 8, entries: ["historicalVwc"]},
      ]},
      { type: "row", entries: [
        { type: "col", size: 4, entries: ["latestTemperature"]},
        { type: "col", size: 8, entries: ["historicalTemperature"]},
      ]},
      { type: "row", entries: [
        { type: "col", size: 4, entries: ["latestEC"]},
        { type: "col", size: 8, entries: ["historicalEC"]},
      ]}
    ]
  };
}

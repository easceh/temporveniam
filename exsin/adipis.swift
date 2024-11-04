import UIKit
import Accessibility

func updateChartDescriptor(_ descriptor: AXChartDescriptor) {
    // Example of updating the title
    descriptor.title = "Updated Chart Title"
    
    // Example of updating the summary
    descriptor.summary = "This chart shows updated data points over time."
    
    // Example of updating axes
    let updatedXAxis = AXNumericDataAxisDescriptor(
        title: "Time (s)",
        range: 0...100,
        gridlinePositions: []
    ) { value in
        return "\(value) sec"
    }
    
    let updatedYAxis = AXNumericDataAxisDescriptor(
        title: "Value",
        range: 0...100,
        gridlinePositions: []
    ) { value in
        return "\(value)"
    }
    
    descriptor.axes = [updatedXAxis, updatedYAxis]
    
    // Example of updating series
    let updatedSeries = AXDataSeriesDescriptor(
        name: "Updated Series",
        isContinuous: true,
        dataPoints: [
            AXDataPoint(x: 10, y: 10),
            AXDataPoint(x: 20, y: 20),
            AXDataPoint(x: 30, y: 30),
            AXDataPoint(x: 40, y: 40),
            AXDataPoint(x: 50, y: 50)
        ]
    )
    
    descriptor.series = [updatedSeries]
    
    // Notify accessibility clients about the updated descriptor
    UIAccessibility.post(notification: .layoutChanged, argument: descriptor)
}

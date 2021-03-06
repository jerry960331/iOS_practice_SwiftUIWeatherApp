//
//  MapViewMK2.swift
//  iOS_practice_SwiftUIWeather
//
//  Created by 歐東 on 2021/2/2.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapViewMK2
    
    init(_ control: MapViewMK2) {
        self.control = control
    }
    
    func mapView(_ mapViewMK2: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                mapViewMK2.setRegion(region, animated: true)
            }
        }
    }
}

struct MapViewMK2: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = GestureRecognizableMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapViewMK2>) {
        updateAnnotation(from: uiView)
    }
    
    private func updateAnnotation(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}

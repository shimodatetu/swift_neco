//
//  MapView.swift
//  MapPins
//
//  Created by Shota Shimazu on 2021/05/27.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    let map = MKMapView()
    
    
    @Binding var location: CLLocationCoordinate2D
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

        // SFC Delta coordinate 35.388465, 139.425502
        let coordinate = CLLocationCoordinate2D(latitude: 35.388465, longitude: 139.425502)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        // 地図のタイプを変更, (航空写真など)
    
        uiView.mapType = .satellite
        uiView.addAnnotation(annotation)
        uiView.setRegion(region, animated: true)

    }
}

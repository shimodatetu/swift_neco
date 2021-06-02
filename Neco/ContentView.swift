//
//  ContentView.swift
//  MapPins
//
//  Created by Shota Shimazu on 2021/05/27.
//

import SwiftUI
import MapKit
struct ContentView: View {

    @State private var text: String = ""
    @State private var count: Int = 2
    
    @State private var distance: Double = 0
    
    @State private var isDisplay: Bool = false
    
    @State private var pins: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 35.388465, longitude: 139.425502)

    
    var body: some View {
        ZStack {
            TextFieldAlertView(
                text: $text,
                isShowingAlert: $isDisplay,
                placeholder: "",
                isSecureTextEntry: false,
                title: "座標を入力",
                message: "最新のピンと初期地との距離："+String(Double(Int(distance)) / 100)+"km\n"+String(count)+"個目のピンのMap座標を入力してください",
                leftButtonTitle: "キャンセル",
                rightButtonTitle: "追加",
                leftButtonAction: nil,
                rightButtonAction: {
                    
                    let latitude: Double = Double(text.components(separatedBy: ", ")[0]) ?? 0.0
                    
                    let longitude: Double = Double(text.components(separatedBy: ", ")[1]) ?? 0.0

                    let newCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    
                    
                    pins = newCoordinate
                    distance = pow( pow(111.11 * (35.388465 - latitude),2)+pow(80 * (139.425502 - longitude),2) , 0.5) * 100
                    count+=1
                    
                }
            )
            VStack {
                MapView(location: $pins)
                Button("座標を入力") {
                    isDisplay = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


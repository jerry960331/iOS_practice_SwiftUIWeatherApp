//
//  Cities.swift
//  iOS_practice_SwiftUIWeather
//
//  Created by 歐東 on 2020/12/16.
//

import Foundation
import CoreLocation

struct City: Decodable, Hashable {
    static func == (lhs: City, rhs: City) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let coord: coord
    let country: String
    let name: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coord.lat,
            longitude: coord.lon)
    }
}

// 測試用
let citiesList = [
    City(id: 5128581, coord: coord(lon: -74.005966, lat: 40.714272), country: "US",name: "New York City"),
    City(id: 1668341, coord: coord(lon: 121.531853, lat: 25.04776), country: "TW" ,name: "Taipei"),
    City(id: 1668399, coord: coord(lon: 120.683899, lat: 24.1469), country: "TW",name: "Taichung"),
    City(id: 1668355, coord: coord(lon: 120.213333, lat: 22.990829), country: "TW", name: "Tainan")
]

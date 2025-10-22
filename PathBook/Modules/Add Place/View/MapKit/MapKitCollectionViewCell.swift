//
//  MapKitCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 6.10.2025.
//

import UIKit
import MapKit

class MapKitCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var mapKit: MKMapView!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    mapKit.removeAnnotations(mapKit.annotations)
  }
  
  func configure() {
    // Ayasofya koordinatları
    let ayasofyaCoordinate = CLLocationCoordinate2D(latitude: 41.0086, longitude: 28.9802)
    
    // Yakınlaştırma seviyesi (region span)
    let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    let region = MKCoordinateRegion(center: ayasofyaCoordinate, span: span)
    
    // Haritada göster
    mapKit.setRegion(region, animated: false)
    
    mapKit.mapType = .standard
    mapKit.overrideUserInterfaceStyle = .light
    mapKit.layer.masksToBounds = true
    mapKit.layer.cornerRadius = 8
    
    // Pin ekle
    let annotation = MKPointAnnotation()
    annotation.coordinate = ayasofyaCoordinate
    annotation.title = "Ayasofya Camii"
    mapKit.addAnnotation(annotation)
    
    mapKit.layer.cornerRadius = 12
  }
  
  func searchAndShow(_ query: String) {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = query
    let search = MKLocalSearch(request: request)
    
    search.start { [weak self] response, _ in
      guard let self = self, let item = response?.mapItems.first else { return }
      
      self.mapKit.removeAnnotations(self.mapKit.annotations)
      let annotation = MKPointAnnotation()
      annotation.coordinate = item.placemark.coordinate
      annotation.title = item.name
      self.mapKit.addAnnotation(annotation)
      
      let region = MKCoordinateRegion(center: item.placemark.coordinate,
                                      span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
      self.mapKit.setRegion(region, animated: true)
    }
  }
}

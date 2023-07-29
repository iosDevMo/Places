//
//  PlacesViewController.swift
//  Places
//
//  Created by mohamdan on 27/07/2023.
//

import UIKit
import RealmSwift
import CoreLocation
import MapKit

class PlacesViewController: UIViewController {
    
    let realm = try! Realm()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let landMarks = realm.objects(Landmark.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    


}
extension PlacesViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.shared.landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        cell.name.text = Places.shared.landmarks[indexPath.row].name
        cell.desc.text = Places.shared.landmarks[indexPath.row].desc
        cell.time.text = DateFormatter.localizedString(from: Places.shared.landmarks[indexPath.row].date, dateStyle: .short, timeStyle: .short)
        
        return cell
    }
}

extension PlacesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let latitude:CLLocationDegrees =  0.0
        let longitude:CLLocationDegrees =  0.0
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        //mapItem.name = "\(self.venueName)"
        mapItem.openInMaps(launchOptions: options)
    }
}

//
//  ViewController.swift
//  MapKit en iOS
//
//  Created by alumno on 4/04/17.
//  Copyright © 2017 alumno. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let location = CLLocation(latitude: -12.102732, longitude: -77.025885)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centrar(ubicacion: location)
        
        let marcador = Marcador(title: "Marcador 1", coordinate: location.coordinate,subtitle:"SubTitulo del Marcador 1")
        
        mapView.addAnnotation(marcador)
        
        //marcador.nombre = "Marcador 1"
        //marcador.coordenada = location.coordinate
        
        //let anotationView = MKAnnotationView()
        //anotationView.annotation?.title = marcador.nombre
        //anotationView.annotation?.coordinate = marcador.coordenada
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func centrar(ubicacion: CLLocation){
        let region = MKCoordinateRegion(center: ubicacion.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func segChangeMap(_ sender: UISegmentedControl) {
    
    
        let opcion = sender.selectedSegmentIndex
        
 
        switch opcion {
        case 0:
            self.mapView.mapType = MKMapType.standard
        case 1:
            self.mapView.mapType = MKMapType.satellite
        default:
            self.mapView.mapType = MKMapType.hybrid
            
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identificador = "marcador"
        var view:MKPinAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identificador) {
            dequeuedView.annotation = annotation
            view = dequeuedView as! MKPinAnnotationView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identificador)
            
            view.canShowCallout = true
            
            view.calloutOffset = CGPoint(x: 0, y: -10)
            
            //view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView!
            //view.detailCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView!
            
        }
        
        return view
    }

}


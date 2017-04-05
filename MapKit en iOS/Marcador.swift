//
//  Marcador.swift
//  MapKit en iOS
//
//  Created by alumno on 4/04/17.
//  Copyright © 2017 alumno. All rights reserved.
//

import UIKit
import MapKit

class Marcador: NSObject, MKAnnotation {
    
    var title:String?
    var subtitle:String?
    var coordinate:CLLocationCoordinate2D
    

    init(title:String , coordinate:CLLocationCoordinate2D, subtitle:String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
        
        super.init()
    }
    
}

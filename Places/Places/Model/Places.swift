//
//  Places.swift
//  Places
//
//  Created by mohamdan on 29/07/2023.
//

import Foundation
import RealmSwift

class Places {
    static let shared = Places()
    var landmarks : Results<Landmark>!
    private init () {}
}

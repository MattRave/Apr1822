//
//  Vehicle.swift
//  protocolProject
//
//  Created by Luat on 8/9/21.
//

/// Notes from after interview
/// Todo:
/// Add shop
/// Shop holds multiple mechanics
/// All mechanics have access to the shop's inspection array
/// Adding vehicle to inspection array should be done by the shop
/// The shop is some kind of InspectionListManager

import Foundation

protocol VehicleProtocol {
    var id: UUID { get }
    var make: String { get }
    var model: String { get }
}

struct Vehicle: VehicleProtocol {
    let id = UUID()
    let make: String
    let model: String
}



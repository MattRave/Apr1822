//
//  Inspection.swift
//  protocolProject
//
//  Created by Luat on 8/9/21.
//

import Foundation

protocol Inspectable {
    var vehicle: VehicleProtocol { get }
    var categories: [Ticket.Category] { get }
}
protocol Repairable {}
protocol Billable: Inspectable & Repairable {
    var customerName: String { get }
}

struct Ticket: Billable {
    var vehicle: VehicleProtocol
    var categories: [Category]
    var customerName: String
    enum Category: String {
        case accel
        case braking
    }
}



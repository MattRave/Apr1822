//
//  ViewController.swift
//  dependencyInj
//
//  Created by Rave Bizz on 5/18/22.
//

import UIKit

class DrinksViewController: UIViewController {
    
    let viewModel: DrinnkViewModel

    init(viewModel: DrinnkViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        viewModel.getData { drink in
            if let drink = drink {
                print("has drink from real network: \(drink.drinkName)")
            } else {
                print("no drink: using mock network, show error to user")
            }
        }
    }
}

class DrinnkViewModel {
    
    var drinksServce: NetworkService
    
    init(drinksService: NetworkService) {
        self.drinksServce = drinksService
    }
    
    func getData(completion: @escaping (Drink?) -> Void) {
        drinksServce.getData(completion: completion)
    }
}

protocol NetworkService {
    func getData<T: Codable>(completion: @escaping (T?) -> Void)
}

class DrinksService: NetworkService {
    func getData<T: Codable>(completion: @escaping (T?) -> Void) {
        if let data = try? JSONEncoder().encode(Drink(drinkName: "Long Island")) {
            let decoded = try? JSONDecoder().decode(T.self, from: data)
            completion(decoded)
        }
    }
}

class MockService: NetworkService {
    func getData<T: Codable>(completion: @escaping (T?) -> Void) {
        completion(nil)
    }
}

struct Drink: Codable {
    let drinkName: String
}

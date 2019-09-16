//
//  Result.swift
//  NetworkingAbstraction
//
//  Created by Ghiran Sergiu-Robert on 22/07/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value?)
    case failure(CustomError)
}

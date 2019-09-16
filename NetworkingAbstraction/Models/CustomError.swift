//
//  CustomError.swift
//  NetworkingAbstraction
//
//  Created by Ghiran Sergiu-Robert on 22/07/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case invalidURL, requestFailure, decodingFailure
}

extension CustomError {
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailure:
            return "The request finished with errors"
        case .decodingFailure:
            return "Could not decode the data"
        }
    }
}

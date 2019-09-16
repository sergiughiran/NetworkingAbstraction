//
//  CommentsService.swift
//  NetworkingAbstraction
//
//  Created by Ghiran Sergiu-Robert on 22/07/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation

final class CommentsService {
    
    // MARK: - Private Properties
    
    private let apiManager = APIManager.shared

    // MARK: - Logic
    
    func fetchComments(completion handler: @escaping (Result<[Comment]>) -> Void) {
        apiManager.executeRequest(at: Endpoint.comments(), completion: handler)
    }
}

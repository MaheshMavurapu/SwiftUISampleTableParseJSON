//
//  ReposStore.swift
//  SampleSwiftUI
//
//  Created by Mahesh Mavurapu on 25/11/19.
//  Copyright © 2019 Mahesh Mavurapu. All rights reserved.
//

import Foundation
import Combine

class ReposStore: ObservableObject {
    @Published private(set) var repos: [Repo] = []

    private let service: GithubService
    init(service: GithubService) {
        self.service = service
    }

    func fetch(matching query: String) {
        service.search(matching: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos): self?.repos = repos
                case .failure: self?.repos = []
                }
            }
        }
    }
}

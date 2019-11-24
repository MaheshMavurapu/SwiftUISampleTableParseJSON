//
//  SearchView.swift
//  SampleSwiftUI
//
//  Created by Mahesh Mavurapu on 25/11/19.
//  Copyright © 2019 Mahesh Mavurapu. All rights reserved.
//

import SwiftUI

//let actualUrl = "https://api.github.com/search/repositories?q=Swift"

struct SearchView : View {
    @State private var query: String = "Swift"
    @EnvironmentObject var repoStore: ReposStore

    var body: some View {
        NavigationView {
            List {
                TextField("Type something...", text: $query, onCommit: fetch)
                ForEach(repoStore.repos) { repo in
                    RepoRow(repo: repo)
                }
            }.navigationBarTitle(Text("Search"))
        }.onAppear(perform: fetch)
    }

    private func fetch() {
        repoStore.fetch(matching: query)
    }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
#endif

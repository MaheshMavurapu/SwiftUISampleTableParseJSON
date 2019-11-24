//
//  RepoRow.swift
//  SampleSwiftUI
//
//  Created by Mahesh Mavurapu on 25/11/19.
//  Copyright © 2019 Mahesh Mavurapu. All rights reserved.
//

import SwiftUI

struct RepoRow: View {
    let repo: Repo

    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .font(.headline)
            Text(repo.description)
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow(repo: Repo(id: 0, name: "", description: ""))
    }
}
#endif

//
//  SearchView.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI

struct SearchView: View {
    @AppStorage("exText") var exText = ""
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("연습", text: $exText)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

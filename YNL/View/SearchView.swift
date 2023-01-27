//
//  SearchView.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI

struct SearchView: View {
    let array = [""]
    
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                } //리스트의 스타일 수정
                .listStyle(PlainListStyle())
                  //화면 터치시 키보드 숨김
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .navigationBarTitle("검색기능")
        }
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        let darckColor = Color.black
        
        switch scheme {
        case .light : return lightColor
        case .dark : return darckColor
        @unknown default: return lightColor
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//
//  LoginView.swift
//  YNL
//
//  Created by 이정후 on 2023/01/26.
//

import SwiftUI

struct LoginView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 10) {
            Text("로그인이 필요합니다")
                .font(.largeTitle.bold())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}

//
//  MyInfoView.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI

struct MyInfoView: View {
    @State var stack = NavigationPath()

    var body: some View {
        NavigationStack(path: $stack) {
                    List {
                        Section {
//                            NavigationLink()
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.all, 10)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 3) {
                                Text("이름")
                            }
//                            NavigationLink("Pink", value: "2")
//                            NavigationLink("Teal", value: "3")
//                            NavigationLink("회원탈퇴", value: "4")
                        }
                        .navigationDestination(for: String.self) { value in
                            Text("Child Number \(value)")
                            Button("뒤로가기") {
                                stack.removeLast()
                            }
                        }
                        .navigationTitle("내 정보")
                    }
                        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}

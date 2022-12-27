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
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필화면")
                    } label: {
                        HStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(.all, 10)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("이름")
                                    .font(.system(size: 24))
                                    .fontWeight(.regular)
                            }
                            .padding(.leading, 6)
                        }
                        .padding(.vertical, 10)
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

//
//  LoginView.swift
//  YNL
//
//  Created by 이정후 on 2023/01/26.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    @State var createAccount: Bool = false
    var body: some View {
        VStack(spacing: 10) {
            Text("YLN")
                .font(.largeTitle.bold())
                .hAlign(.leading)
            
            Text("패션공유 블라블라")
                .font(.title3)
                .hAlign(.center)
            
            VStack(spacing: 12) {
                TextField("이메일", text: $emailID)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                    .padding(.top, 25)
                
                SecureField("비밀번호", text: $password)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                
                Button("비밀번호를 잊어버리셨나요?", action: {})
                    .font(.callout)
                    .fontWeight(.medium)
                    .tint(.black)
                    .hAlign(.trailing)
                
                Button {
                    
                } label: {
                    // MARK: 로그인 버튼
                    Text("Sign in")
                        .foregroundColor(.white)
                        .fillView(.black)
                }
                .padding(.top, 10)
            }
            
            Text("또는")
                .fontWidth(.condensed)
            
            // MARK: 회원가입 버튼
            HStack {
                Button("이메일로 회원가입") {
                    createAccount.toggle()
                }
                    .foregroundColor(.white)
                    .fillView(.gray)
                Button("이메일로 로그인", action: {})
                    .foregroundColor(.white)
                    .fillView(.gray)
            }
        }
        .vAlign(.top)
        .padding(15)
        .fullScreenCover(isPresented: $createAccount) {
            RegisterView()
        }
    }
}

// MARK: 회원가입 뷰

struct RegisterView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    @State var userName: String = ""
//    @State var userBio : String = ""
//    @State var userBioLink : String = ""
    @State var userProfilePicData: Data?
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 10) {
            Text("YLN")
                .font(.largeTitle.bold())
                .hAlign(.leading)
            
            Text("회원가입")
                .font(.title3)
                .hAlign(.center)
            
            ViewThatFits {
                ScrollView(.vertical, showsIndicators: false) {
                    HelperView()
                }
                HelperView()
            }
            
            
            // MARK: 회원가입 버튼
            HStack {
                Text("이미 계정이 있나요?")
                    .foregroundColor(.gray)
                Button("이메일로 로그인") {
                    dismiss()
                }
                .fontWeight(.bold)
                .foregroundColor(.black)
            }
            .font(.callout)
            .vAlign(.bottom)
        }
        .vAlign(.top)
        .padding(15)
    }
    
    @ViewBuilder
    func HelperView() -> some View {
        VStack(spacing: 12) {
            
            TextField("이름", text: $userName)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
                .padding(.top, 25)
            
            TextField("이메일", text: $emailID)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
            
            SecureField("비밀번호", text: $password)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
            
            Button {
                
            } label: {
                // MARK: 로그인 버튼
                Text("Sign up")
                    .foregroundColor(.white)
                    .fillView(.black)
            }
            .padding(.top, 10)
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
    
    // MARK: 상자 커스텀
    func border(_ width: CGFloat, _ color: Color) -> some View {
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(color, lineWidth: width)
            }
    }
    // MARK: 채우기 색상
    func fillView(_ color: Color) -> some View {
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(color)
            }
    }
}

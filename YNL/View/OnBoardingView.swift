//
//  OnBoardingView.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    var body: some View {
        Text("OnBoarding View!")
//            .fullScreenCover(isPresented: $isFirstLaunching) {
//                OnBoardingView(isFirstLaunching: isFirstLaunching)
//            }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

//
//  ContentView.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    
    var body: some View {
        OnBoardingView()
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
//                    Text("Search")
                }
            AddView()
                .tabItem {
                    Image(systemName: "plus.app")
//                    Text("Mark")
                }
            InterestView()
                .tabItem {
                    Image(systemName: "bookmark.circle")
//                    Text("Mark")
                }
            MyInfoView()
                .tabItem {
                    Image(systemName: "person.fill")
//                    Text("My Info")
                }
        }
//        .font(.title)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

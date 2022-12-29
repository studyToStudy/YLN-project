//
//  AddView.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI
import PhotosUI

struct AddView: View {
    @StateObject var imagePicker = ImagePicker()
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedItem: PhotosPickerItem?
    @State private var image: UIImage?
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    var body: some View {
        NavigationStack {
            VStack{
                if !imagePicker.images.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0..<imagePicker.images.count, id: \.self) { index in
                                imagePicker.images[index]
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                } else {
                    Text("등록된 사진이 없습니다!")
                }
            }
            .padding()
            .navigationTitle("사진업로드")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    //                    PhotosPicker(selection: $imagePicker.imageSelections, maxSelectionCount: 10, matching: .images,
                    //                                 photoLibrary: .shared()) {
                    //                         Image(systemName: "photo.on.rectangle.angled")
                    //                            .imageScale(.large)
                    //                    }
                    PhotosPicker(selection: $imagePicker.imageSelections, matching: .any(of: [.images, .not(.livePhotos)])) {
                        Label("Select a photo", systemImage: "photo")
                    }
                    .tint(.blue)
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .labelStyle(.automatic)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(ViewModel())
    }
}


//
//  ImagePicker.swift
//  YNL
//
//  Created by 이정후 on 2022/12/28.
//

import SwiftUI
import PhotosUI
import Foundation

@MainActor
class ImagePicker: ObservableObject {
    @Published var image: Image?
    @Published var images: [Image] = []
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }

    @Published var imageSelections: [PhotosPickerItem] = [] {
        didSet {
            Task {
                if !imageSelections.isEmpty {
                    try await loadTransferable(from: imageSelections)
                    imageSelections = []
                }
            }
        }
    }

    func loadTransferable(from imageSelection: [PhotosPickerItem]) async throws {
        do {
            for imageSelection in imageSelection {
                if let data = try await imageSelection.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        self.images.append(Image(uiImage: uiImage))
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
//        print(Image.transferRepresentation)
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
    
    // UIImage convert to NSData
//    func setUserDefaults(UIImage value: UIImage, _ key: String) {
    // compressionQuality: 압축된 데이터 퀄리티
//        let imageData = value.jpegData(compressionQuality: 1.0)
//        // let imageData = UIImage.jpegData(value)
//        UserDefaults.standard.set(imageData, forKey: key)
//    }
}

//import SwiftUI
//import PhotosUI
//
//struct PhotoPicker: UIViewControllerRepresentable {
//  typealias UIViewControllerType = PHPickerViewController
//
//  let filter: PHPickerFilter
//  var limit: Int = 0 // 0 == 'no limit'.
//  let onComplete: ([PHPickerResult]) -> Void
//
//  func makeUIViewController(context: Context) -> PHPickerViewController {
//    var configuration = PHPickerConfiguration()
//    configuration.filter = filter
//    configuration.selectionLimit = limit
//    let controller = PHPickerViewController(configuration: configuration)
//    controller.delegate = context.coordinator
//    return controller
//  }
//
//  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//
//  func makeCoordinator() -> Coordinator {
//    Coordinator(self)
//  }
//
//  class Coordinator: PHPickerViewControllerDelegate {
//
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//      parent.onComplete(results)
//      picker.dismiss(animated: true)
//    }
//
//    private let parent: PhotoPicker
//
//    init(_ parent: PhotoPicker) {
//      self.parent = parent
//    }
//  }
//
//  static func convertToUIImageArray(fromResults results: [PHPickerResult], onComplete: @escaping ([UIImage]?, Error?) -> Void) {
//    var images = [UIImage]()
//
//    let dispatchGroup = DispatchGroup()
//
//    for result in results {
//      dispatchGroup.enter()
//      let itemProvider = result.itemProvider
//      if itemProvider.canLoadObject(ofClass: UIImage.self) {
//        itemProvider.loadObject(ofClass: UIImage.self) { (imageOrNil, errorOrNil) in
//          if let error = errorOrNil {
//            onComplete(nil, error)
//            dispatchGroup.leave()
//          }
//          if let image = imageOrNil as? UIImage {
//            images.append(image)
//            dispatchGroup.leave()
//          }
//        }
//      }
//    }
//    dispatchGroup.notify(queue: .main) {
//      onComplete(images, nil)
//    }
//  }
//}

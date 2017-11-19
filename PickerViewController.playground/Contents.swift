//: Playground - noun: a place where people can play

import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


import UIKit

protocol YouthImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showPickerOptions()

//    func
}

extension YouthImagePicker where Self: UIViewController{
    func showPickerOptions() {
        print("display alert sheet")

        let alert = UIAlertController(title: "Pick", message: "Me", preferredStyle: .ActionSheet)
        let a1 = UIAlertAction(title: "a1", style: .Default) { action in
            print("a1: \(action)")

        }
        let a2 = UIAlertAction(title: "a2", style: .Default) { action in
            print("a2: \(action)")
        }

        [a1, a2].forEach { alert.addAction($0) }

        print("alert: \(alert)")
        presentViewController(alert, animated: false, completion: nil)

    }

    private func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = true
        picker.delegate = self

    }
}

protocol Something {
    func didCancel()
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
}

extension Something {
    func didCancel() {
        print("default implementation")
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("default imagePickerControllerDidCancel")
    }
}


class ViewController: UIViewController {

    var picker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellowColor()

        picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = true
        picker.delegate = self

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

//        showPicker()
    }

    func showPicker() {
        presentViewController(picker, animated: true, completion: nil)
    }

}

extension ViewController: Something {

}

extension ViewController: YouthImagePicker {

}




let vc = ViewController()
XCPlaygroundPage.currentPage.liveView = vc
//XCPlaygroundPage.currentPage.liveView = vc.view
vc.showPickerOptions()
//: Playground - noun: a place where people can play

import UIKit

let
    a = 1,
    b = 2,
    c = 3

for i in 7...10 {
    println(i)
}

let range = "a"..."z"

//for x in range {
//    println(x)
//}


let view = UIView()
let l1Count = 2, l2Count = 2, l3Count = 3
for i in 0..<l1Count {
    let l1Subview = UIView()
    l1Subview.tag = i + 1
    view.addSubview(l1Subview)
    for j in 0..<l2Count {
        let l2Subview = UIView()
        l2Subview.tag = l1Subview.tag * 10 + j
        l1Subview.addSubview(l2Subview)
        for k in 0..<l3Count {
            let l3Subview = UIView();
            l3Subview.tag = l2Subview.tag * 10 + k
            l2Subview.addSubview(l3Subview)
        }
    }

}

func f1(view: AnyObject) -> [UIView] {
    return view.subviews.reduce(view.subviews) {
        $0 + f1($1)
    } as! [UIView]
}

func f2(view: AnyObject) -> [UIView] {
    return view.subviews as! [UIView] + view.subviews.map(f2).reduce([], combine: +)
}

func f3(view: AnyObject) -> [AnyObject] {
    return view.subviews.reduce(view.subviews) {
        $0 + f3($1)
    }
}

func f4(view: AnyObject) -> [AnyObject] {
    return view.subviews + view.subviews.map(f4).reduce([], combine: +)
}

func f41(view: AnyObject) -> [AnyObject] {
    return view.subviews.map(f41).reduce(view.subviews, combine: +)
}


func f5(view: AnyObject) -> [AnyObject] {
    return view.subviews + flatMap(view.subviews, f5)
}

func f6(view: AnyObject) -> [AnyObject] {
    return view.subviews + view.subviews.flatMap(f6)
}

// unsafeSubviews ?
extension UIView {
    var safeSubviews: [UIView] {
        return self.subviews as! [UIView]
    }
}

func f61(view: UIView) -> [UIView] {
    return view.safeSubviews + view.safeSubviews.flatMap(f61)
}



for v in f2(view) {
    println(v.tag)
}

println("---")

for v in f41(view) {
    println(v.tag)
}

println("---")
for v in f61(view) {
    println(v.tag)
}




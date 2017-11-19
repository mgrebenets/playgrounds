 import UIKit

 class ViewController: UIViewController {

    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.



        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "update", userInfo: nil, repeats: true);

    }

    func update() {
        counter++

        println(counter)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 }

 var vc = ViewController()
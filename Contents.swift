//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var button = UIButton(type: .system)
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        button = UIButton(type: .system)
        button.setTitle("Hello", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .red
        button.frame = CGRect(x: 20, y: 10, width: 200, height: 80)
        view.addSubview(button)
        button.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        self.view = view
    }
    
    @objc func onButtonPressed () {
        //Animating with UIVIEW methods.
        UIView.animate(withDuration: 0.7, delay : 0.5, options : .curveEaseInOut ,  animations: {
            self.button.frame.size.width = 80
            self.button.frame.size.height = 80
            self.button.layer.cornerRadius = 40
        }) { (_) in
            self.button.backgroundColor = .blue
        }
        
        //Animating with UIViewPropertyAnimator
        let animator = UIViewPropertyAnimator(duration: 0.3 , curve : .easeInOut){
            self.button.frame.size.width = 80
            self.button.frame.size.height = 80
            self.button.layer.cornerRadius = 40
        }
        
        
        //The diference between UIViewPropertyAnimator and the UIVIEW.animate() is that we can add conditions
        if true {
            animator.addAnimations{
                self.button.frame.size.height = 50
            }
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
PlaygroundPage.current.needsIndefiniteExecution = true

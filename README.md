# spin-arrow
An arrow bezier curve with transformation supports

Example:

```
class MyViewController : UIViewController {
    let angle = 2*Double.pi / 10.0
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        for i in 0..<10 {
            let pointer = PointerView()
            pointer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            pointer.frame = CGRect(x: 100, y: 300, width: 200, height: 10)
            pointer.rotate(angle: angle * Double(i), anchorPoint: CGPoint(x: 0, y: 0.5))
            view.addSubview(pointer)
            
            UIView.animate(withDuration: 3.0, animations: { () -> Void in
                let angle = CGFloat(self.angle * Double(i) + Double.pi);
                pointer.transform = CGAffineTransform.init(rotationAngle: angle)
            })
        }
        
        self.view = view
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
```

Results in:
![Result](https://media3.giphy.com/avatars/100soft/WahNEDdlGjRZ.gif)

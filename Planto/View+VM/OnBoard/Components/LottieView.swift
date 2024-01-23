//
//  LottieView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    var filename : String
    
    func makeUIView(context:
        UIViewRepresentableContext<LottieView>)-> UIView {
             let view = UIView(frame: .zero)
             let animationView = LottieAnimationView()
             let animation = LottieAnimation.named (filename)
             animationView.animation = animation
             animationView.contentMode =  .scaleAspectFit
             animationView.play()
             animationView.play(fromProgress: 0, //Start
                                toProgress: 1, //End
                                loopMode: LottieLoopMode.repeat(15),//Number of Times
                                completion: { (finished) in
                                 if finished {
                                     print("Animation Complete")
                                   } else {
                                  print("Animation cancelled")
                                  }
                               })
            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)
            
            NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo:view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo:view.heightAnchor)])
           
            return view
          }
    
        func updateUIView( _ uiView: UIView, context:
            UIViewRepresentableContext<LottieView>){
                }
          }

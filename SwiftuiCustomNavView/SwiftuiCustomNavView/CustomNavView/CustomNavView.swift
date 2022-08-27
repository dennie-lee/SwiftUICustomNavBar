//
//  CustomNavView.swift
//  SwiftuiCustomNavView
//
//  Created by liqinghua on 2022/8/27.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
    // MARK: 内容
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
           ///自定义的内容容器
           CustomNavBarContainerView {
              content
          }
          //隐藏系统navigationBar，使用自定义的navigationBar
          .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            Color.red.ignoresSafeArea()
        }
    }
}


// 设置右滑动可以退出页面
extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

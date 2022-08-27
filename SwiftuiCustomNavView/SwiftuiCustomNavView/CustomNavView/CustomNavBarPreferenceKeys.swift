//
//  CustomNavBarPreferenceKeys.swift
//  SwiftuiCustomNavView
//
//  Created by liqinghua on 2022/8/27.
//

import SwiftUI

//自定义标题PreferenceKey
struct CustomNavBarTitilePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

//自定义副标题PreferenceKey
struct CustomNavBarSubtitlePreferenceKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

//自定义返回PreferenceKey
struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    //设置标题
    func customNavigationTitle(_ title: String) -> some View {
        self
            .preference(key: CustomNavBarTitilePreferenceKey.self, value: title)
    }
    //设置副标题
    func customNavigationSubtitle(_ subtitle: String?) -> some View {
        self
            .preference(key: CustomNavBarSubtitlePreferenceKey.self, value: subtitle)
    }
    //是否隐藏返回键
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        self
            .preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    //综合方法
    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}

/*
The MIT License (MIT)

Copyright (c) 2017 Kawoou (Jungwon An)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit

public class DrawerFloatTransition: DrawerTransition {

    // MARK: - Property
    
    public var floatFactor: Float
    
    
    // MARK: - Public
    
    override func initTransition(content: DrawerContent) {
        super.initTransition(content: content)
        
        content.isBringToFront = false
    }
    
    override func startTransition(content: DrawerContent, side: DrawerSide) {
        super.startTransition(content: content, side: side)
    }
    
    override func endTransition(content: DrawerContent, side: DrawerSide) {
        super.endTransition(content: content, side: side)
    }
    
    override func transition(content: DrawerContent, side: DrawerSide, percentage: CGFloat, viewRect: CGRect) {
        
        switch content.drawerSide {
        case .left:
            content.contentView.transform = CGAffineTransform.identity
            content.contentView.frame = CGRect(
                x: content.drawerOffset,
                y: viewRect.minY,
                width: CGFloat(content.drawerWidth),
                height: content.contentView.frame.height
            )
        case .right:
            content.contentView.transform = CGAffineTransform.identity
            content.contentView.frame = CGRect(
                x: content.drawerOffset,
                y: viewRect.minY,
                width: CGFloat(content.drawerWidth),
                height: content.contentView.frame.height
            )
        case .none:
            content.contentView.transform = CGAffineTransform(
                scaleX: CGFloat(1.0 - Float(fabs(percentage)) * self.floatFactor),
                y: CGFloat(1.0 - Float(fabs(percentage)) * self.floatFactor)
            ).translatedBy(
                x: viewRect.size.width * percentage,
                y: 0
            )
        }
        
    }
    
    
    // MARK: - Lifecycle
    
    init(floatFactor: Float = 0.2875) {
        self.floatFactor = floatFactor
        
        super.init()
    }
    
}
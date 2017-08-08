# LubanKit (鲁班的工具箱)

Aim to create a declarative way to add Auto Layout constraints for your views, make it easy to read and visualize the view in you mind.

致力于打造一个非常易于理解的声明式 Auto Layout 工具，让你看代码就能想象出视图的大致模样，从而让维护布局代码更容易。

Still WIP, current version support following format, can you understand it by first look?

目前仍在编码中，目前的代码以及支持下面这样的布局定义方式，看看你第一眼是否能看明白?

```swift
        lookinside(contentView) {
            horizontal {
                12 <-- avatarImageView.space(100) --- 8 --- titleLabel --> 12
                
                titleLabel.head == subtitleLabel.head
                titleLabel.tail == subtitleLabel.tail
            }
            
            vertical {
                titleLabel.space(21) --- 3 --- subtitleLabel.space(21)
                
                avatarImageView.shape == square
                avatarImageView.middle == middleline
                avatarImageView.head == titleLabel.head
            }
        }
```


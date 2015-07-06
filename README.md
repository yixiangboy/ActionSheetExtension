# ActionSheetExtension
扩展IOS系统自带ActionSheet，使其支持图文混排。
====
##一、简介
UIActionSheet是IOS提供给我们开发者的底部弹出菜单控件，一般用于菜单选择、操作确认、删除确认等功能。<br/>IOS官方提供的以下方式对UIActionView进行实例化：<br/>
```
- (instancetype)initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... );
```
从这个api我们可以看出，我们只能设置文本标题，包括destructiveButtonTitle、cancelButtonTitle和otherButtonTitles，官方提供的该控件并不支持图文混排。但有的时候，交互提给我们的需求又需要我们的ActionSheet具有图文混排的效果，那就需要我们自己仿造系统自带的ActionSheet，完成该需求。<br/>项目演示如下：<br/>
![演示图片](http://img.my.csdn.net/uploads/201507/06/1436182724_3996.gif)
<br/>
##二、使用说明
###第一步、构建数据模型

```
@interface Item : NSObject
@property (nonatomic , strong) NSString *icon;//图片地址
@property (nonatomic , strong) NSString *title;//标题
@end
```
###第二步、根据数据模型构建数据

```
Item *item1 = [[Item alloc] init];
item1.icon = @"journey_phone";
item1.title = @"15195905888";
Item *item2 = [[Item alloc] init];
item2.icon = @"journey_phone";
item2.title = @"15195905777";
Item *item3 = [[Item alloc] init];
item3.icon = @"journey_phone";
item3.title = @"15195905777";
NSArray *listData = [NSArray arrayWithObjects:item1,item2,item3, nil];
```
###第三步、使用以上数据将控件初始化

```
PicAndTextActionSheet *sheet = [[PicAndTextActionSheet alloc] initWithList:listData title:@"拨打电话"];
sheet.delegate = self;//该控件使用的代理模式
[sheet showInView:self];
```
因为该控件使用了代理模式，所以在当前Controller需要实现以下代理方法：

```
-(void) didSelectIndex:(NSInteger)index{
}
```
该代理方法，主要是在Controller中能够实现在自定义ActionSheet中的点击事件。
<br/>
##三、实现原理
因为ActionSheet不能支持图片的显示，所以我们就放弃使用扩展UIActionSheet控件的方法。我在本项目中使用的是UITableView+动画，高仿ActionSheet的方法。UTableView可以制作列表选项，动画可以实现系统自带ActionSheet的自底向上和渐变效果。<br/>
<font color=red>注意点：<font><br/>

如果tableview处于uiview上面，uiview整个背景有点击事件，但是我们需要如果我们点击tableview的时候，处理tableview的点击事件，而不是uiview的事件。在这里，我们需要判断我们点击事件是否在uiview上还是在uitableview上。<br/>
解决方案如下：<br/>
1、实现代理：

```
<UIGestureRecognizerDelegate>
```

2、让gesture设置为代理

```
UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
tapGesture.delegate = self;
```

3、实现代理方法，判断点击的是否是uiview还是tableview

```
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}
```
##四、总结
任何一个复杂控件，基本上都是有基础控件组合实现而成。该扩展的ActionSheet也可以用于以下场景：
![场景1](http://code4app.qiniudn.com/photo/547abb9d933bf02c038b6867_1.gif)
<br/><br/>
![场景2](http://code4app.qiniudn.com/photo/539bf71c933bf094418b50a6_1.gif)
<br/>
### 五、下载地址
github下载地址：[https://github.com/yixiangboy/ActionSheetExtension](https://github.com/yixiangboy/ActionSheetExtension)<br/>
如果觉得对你还有些用，给一颗star吧。你的支持是我继续的动力。<br/>
blog地址：[http://blog.csdn.net/yixiangboy/article/details/46778417](http://blog.csdn.net/yixiangboy/article/details/46778417)
<br/>
###博主的话
以前看过很多别人的博客，学到不少东西。现在准备自己也开始写写博客，希望能够帮到一些人。<br/>
我的联系方式：[我的微博](http://weibo.com/5612984599/profile?topnav=1&wvr=6)

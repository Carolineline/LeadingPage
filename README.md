# LeadingPage
===============
使用LeadingPage作为app的引导页：该引导页利用是UICollectionView实现一张图片滑动展示出另一张图片

--------------------
##使用方法

* 将HXLLeadingPage里的文件添加到工程中
* 在AppDelegate.m里创建HXLLeadingPageViewController对象，在封装好的`初始化方法`里添加所要展示的`引导页图片`的名称，在block中回调进入rootViewController的方法
* 可通过获取`app版本号或者build`号来判断是否加载过该版本的引导页，以实现启动app的`第一次时加载`该引导页，具体代码如下：

```
NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *everLaunchThisVersion = [NSString stringWithFormat:@"everLaunched%@", appVersion];
    
    if(![userDefaults boolForKey:everLaunchThisVersion]){
        [userDefaults setBool:YES forKey:everLaunchThisVersion];
        [userDefaults synchronize];
 
        HXLLeadingPageViewController *leadPageVC = [[HXLLeadingPageViewController alloc] initWithArray:@[@"Landingpage1.png",@"Landingpage2.png",@"Landingpage3.png"] andAction:^{
            [self viewController];
        }];
        self.window.rootViewController = leadPageVC;
    }else{
        [self viewController];//进入根视图
    }
    
    [self.window makeKeyAndVisible];

```
------------------
##实现逻辑
1. 在HXLLeadingPageViewController中自定义初始化类方法，以便于直接创建该HXLLeadingPageViewController对象时得到所要加载的图片数组，以及通过block回调实现将要进入的根视图

2. 重写属性的setter（）方法，以获得视图所有加载的UIImageView上的图片<br>使用UIImageView+XLWebCache可以实现对`网络加载的图片进行缓存`<br>在HXLLeadingPageVie中创建CollectionView,在<br>` - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath`方法中判断图片的来源，并给封装好的HXLLeadingPageCollectionViewCell中的pageImageView赋上相应的图片即可<br> 

3. **以下是实现效果的重点**<br>
	* 在HXLImagePageView中<br>`- (void)scrollViewDidScroll:(UIScrollView *)scrollView`中通过获得视图的偏移量来计算当前页面的item的indexPath,从而确定正在滑动的cell和即将展示的下一个cell,并重新赋上移动时的坐标<br>
	* 在自定义的HXLLeadingPageCollectionViewCell中创建一个等同大小的scrollView,并将UIImageView添加到scrollView中，以实现在切换的时候不会出现直接切换cell跳转的效果:relaxed:
	
---------------
##番外
有的时候就像蛇精病一样犯了强迫症，可能因为脑子不好使吧，就要把写过的东西整理一下。<br>总之，多多总结经验还是好的，初次写Demo和文档还是很好玩的,希望自己能够坚持下来，也能更多的吸收精髓，也请多多指教~ 
		
------------------

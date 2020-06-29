


/**
 使用示例:
 
 _loop = [[LoopManager alloc] initWithFrame:CGRectMake(0, 300, 375, 60)];
 _loop.backgroundColor = [UIColor lightGrayColor];
 [self.view addSubview:_loop];
 _loop.dataSource = self.dataSource;
 
 */



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoopManager : UIView

/** 数据源 */
@property (nonatomic, strong) NSArray *dataSource;


@end

NS_ASSUME_NONNULL_END

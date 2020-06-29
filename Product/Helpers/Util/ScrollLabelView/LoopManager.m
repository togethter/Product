
#import "LoopManager.h"
#import "TXScrollLabelView.h"

@interface LoopManager(){
    NSInteger _count; //数据个数
    NSInteger _index; //取值索引
}

@property (nonatomic, strong) TXScrollLabelView *scrollLabelView;



@end

@implementation LoopManager

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        

        self.layer.masksToBounds = YES;
        
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.layer.masksToBounds = YES;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollLabelView.width = self.width;
    self.scrollLabelView.height = self.height;
}
-(void)start{
    
    
}

-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    NSString *scrollTitle = [_dataSource componentsJoinedByString:@"\n"];
    self.scrollLabelView = [TXScrollLabelView scrollWithTitle:scrollTitle type:TXScrollLabelViewTypeFlipNoRepeat velocity:3 options:UIViewAnimationOptionCurveEaseInOut];
    self.scrollLabelView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.scrollLabelView];
    self.scrollLabelView.scrollSpace = 10;
    self.scrollLabelView.font = [UIFont systemFontOfSize:14];
    self.scrollLabelView.textAlignment = NSTextAlignmentLeft;
    self.scrollLabelView.scrollTitleColor = [UIColor blackColor];
    self.scrollLabelView.backgroundColor = [UIColor whiteColor];
    self.scrollLabelView.layer.cornerRadius = 5;
    self.scrollLabelView.frame = self.bounds;
    [self.scrollLabelView beginScrolling];
   
}

@end


#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
}

- (void) setupScrollView {
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.contentInset = UIEdgeInsetsMake(500,0,0,0);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    if (velocity.y >= 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.2 animations:^{
                
                [scrollView setContentOffset:CGPointMake(0, -100) animated:NO];
            }];
        });

    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.2 animations:^{
                
                [scrollView setContentOffset:CGPointMake(0, -500) animated:NO];
            }];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

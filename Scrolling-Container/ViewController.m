
#import "ViewController.h"
#import "JGScrollView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet JGScrollView *scrollView;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupScrollView];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
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

#pragma mark - Setup

- (void) setupScrollView
{
    self.scrollView.delegate = self;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentInset = UIEdgeInsetsMake(500,0,0,0);
}

@end
